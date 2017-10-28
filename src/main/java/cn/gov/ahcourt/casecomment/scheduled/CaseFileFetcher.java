package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.BdMiddleCase;
import cn.gov.ahcourt.casecomment.bean.BdMiddleFile;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.MapKeyComparator;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import org.apache.axiom.om.OMElement;
import org.apache.commons.codec.binary.Base64;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.imageio.stream.FileImageOutputStream;
import javax.persistence.criteria.CriteriaBuilder;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lvrenzhao on 2017/10/12.
 */
@Service
public class CaseFileFetcher {
    @Resource
    private WSService wsService;

    public byte[] getOneFile(int fbsserverxh,String fycode,String ftpserver,String filename){
        String xml = wsService.wsGetOneFileContent(fbsserverxh, filename, ftpserver, fycode);
        String content = getFileContent(xml);
        byte[] data = Base64.decodeBase64(content.getBytes());
        return data;
    }

    public boolean checkFilesFromWS(String ajid,int fbsserverxh,String ah,String fycode){
        try {
            String xml = wsService.wsGetOneFileInfo(fbsserverxh, ah, fycode);
            if(StringUtils.isNotBlank(xml) && xml.indexOf("DA_SSJCXX_LIST")>-1){
                wsService.updatePassCheck(ajid);
                return true;
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return false;
    }

    public void getFilesFromWS(String ajid,int fbsserverxh,String ah,String fycode,Boolean isUpdate){
        try {
            String xml = wsService.wsGetOneFileInfo(fbsserverxh, ah, fycode);
            List<BdMiddleFile> files = convertFilesByXML(xml);
            if(isUpdate){
                if(files!=null && files.size()>0){
                    wsService.deleteFilesByAjid(ajid);
                }
            }
            if(files!=null && files.size()>0){
                for(BdMiddleFile f : files){
                    f.setAjid(ajid);
                    wsService.insertFile(f);
                }
                wsService.updatePassCheck(ajid);
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

//    public

    private List<BdMiddleFile> convertFilesByXML(String xml){
        List<BdMiddleFile> files = new ArrayList<BdMiddleFile>();
        try{
            Document document = DocumentHelper.parseText(xml);
            Element root = document.getRootElement();
            //如果根节点的子节点数量不为4，说明数据有问题，直接返回空项
            if(root == null || root.elements() == null || root.elements().size() != 4){
                return null;
            }
            Map<Integer,BdMiddleFile> bmmap_zj = new TreeMap<Integer, BdMiddleFile>(new MapKeyComparator());
            Map<Integer,BdMiddleFile> bmmap_fj = new TreeMap<Integer, BdMiddleFile>(new MapKeyComparator());
            BdMiddleFile bkb_zj = null;
            BdMiddleFile bkb_fj = null;
            List<Element> subnodes = root.elements();
            String zjid = "",fjid="";
            int zjxh=0,fjxh=0;
            for(Element cnode : subnodes){
                if("DA_SSJCXX_LIST".equals(cnode.getName())){
                    List<Element> jcs = cnode.elements();
                    int jcorder = 2;//从二开始，是因为1留给庭审影像
                    for(Element item : jcs){
                        String itemxml = item.asXML();
                        //本评查系统只抓取正卷和副卷档案，其余卷不关系。
                        String xname = getByRegex(itemxml,"(?<=<JZLB>)\\S+(?=</JZLB>)");
                        if("正卷".equals(xname) || "副卷".equals(xname)){
                            BdMiddleFile bean = new BdMiddleFile();
                            String id = IdGen.uuid();
                            bean.setFileid(id);
                            bean.setPfileid("0");
                            bean.setXname(xname);
                            bean.setXorder(jcorder*1000*100000);
                            bean.setRemarks("true");
                            if("正卷".equals(xname)){
                                zjid = id;
                                zjxh = jcorder;
                            }else{
                                fjid = id;
                                fjxh = jcorder;
                            }
                            jcorder++;
                            files.add(bean);
                        }
                    }
                    //插入封面、目录、备考表
                    if(StringUtils.isNotBlank(zjid)) {
                        files.add(new BdMiddleFile(IdGen.uuid(), zjid, "封面", (zjxh * 1000 + 101)*100000));
                        files.add(new BdMiddleFile(IdGen.uuid(), zjid, "目录", (zjxh * 1000 + 102)*100000));
                        BdMiddleFile bkbzj = new BdMiddleFile(IdGen.uuid(), zjid, "备考表", (zjxh * 1000 + 900)*100000);
                        files.add(bkbzj);
                        bkb_zj = bkbzj;
                    }
                    if(StringUtils.isNotBlank(fjid)) {
                        files.add(new BdMiddleFile(IdGen.uuid(), fjid, "封面", (fjxh * 1000 + 101)*100000));
                        files.add(new BdMiddleFile(IdGen.uuid(), fjid, "目录", (fjxh * 1000 + 102)*100000));
                        BdMiddleFile bkbfj = new BdMiddleFile(IdGen.uuid(), fjid, "备考表", (fjxh * 1000 + 900)*100000);
                        files.add(bkbfj);
                        bkb_fj = bkbfj;
                    }
                }else if("DA_SSJCBM_LIST".equals(cnode.getName())){
                    List<Element> bms = cnode.elements();
                    for(Element item : bms){
                        String itemxml = item.asXML();
                        String xname = getByRegex(itemxml,"(?<=<JZLB>)\\S+(?=</JZLB>)");
                        if("正卷".equals(xname) || "副卷".equals(xname)){
                            BdMiddleFile bean = new BdMiddleFile();
                            bean.setFileid(IdGen.uuid());
                            bean.setPfileid("正卷".equals(xname)?zjid:fjid);
                            bean.setXname(getByRegex(itemxml,"(?<=<CLBT>)\\S+(?=</CLBT>)"));
                            int parentxh = "正卷".equals(xname) ? zjxh : fjxh;
                            int xh = 0;
                            try{
                                xh = Integer.parseInt(getByRegex(itemxml,"(?<=<XH>)\\S+(?=</XH>)"));
                            }catch (Exception ex){
                                ex.printStackTrace();
                            }
                            bean.setXorder(Integer.parseInt(parentxh+String.valueOf(100+xh+2))*100000);
                            if("正卷".equals(xname)){
                                bmmap_zj.put(Integer.parseInt(getByRegex(itemxml,"(?<=<P1>)\\S+(?=</P1>)")), bean);
                            }else if("副卷".equals(xname)){
                                bmmap_fj.put(Integer.parseInt(getByRegex(itemxml,"(?<=<P1>)\\S+(?=</P1>)")), bean);
                            }

                            if(xh>0) {
                                files.add(bean);
                            }
                        }
                    }
                }else if("DA_SSJCYX_LIST".equals(cnode.getName())){
                    List<Element> yxs = cnode.elements();
                    for(Element item : yxs){
                        String itemxml = item.asXML();
                        String xname = getByRegex(itemxml,"(?<=<JZLB>)\\S+(?=</JZLB>)");
                        if("正卷".equals(xname) || "副卷".equals(xname)){
                            BdMiddleFile bean = new BdMiddleFile();
                            bean.setFileid(IdGen.uuid());
                            int yema = 0;
                            try{
                                yema = Integer.parseInt(getByRegex(itemxml,"(?<=<YEMA>)\\S+(?=</YEMA>)"));
                            }catch (Exception ex){
                                ex.printStackTrace();
                            }
                            bean.setXname(String.valueOf(yema));
                            bean.setFtpserver(getByRegex(itemxml,"(?<=<FTPSERVER>)\\S+(?=</FTPSERVER>)"));
                            bean.setFilename(getByRegex(itemxml,"(?<=<FILENAME>)\\S+(?=</FILENAME>)"));
                            String pgtype = getByRegex(itemxml,"(?<=<PGTYPE>)\\S+(?=</PGTYPE>)");
//                            bean.setRemarks(pgtype);
//                            bean.setFlag(xname);
                            BdMiddleFile parent = null;
                            if("正卷".equals(xname)){
                                if("封面".equals(pgtype)){
                                    //todo 两个封面有一个是备考表呢....?(先将两个封面都归到封面底下)
                                    for(int x = 0 ; x < files.size(); x++){
                                        if(StringUtils.isNotBlank(zjid) && zjid.equals(files.get(x).getPfileid()) && "封面".equals(files.get(x).getXname())){
                                            if(StringUtils.isNotBlank(bean.getFilename()) && bean.getFilename().indexOf("_0001") > -1){
                                                //是封面
                                                parent = files.get(x);
                                            }else {
                                                //是备考表
                                                parent = bkb_zj;
                                            }
                                            break;
                                        }
                                    }
                                }else if("目录".equals(pgtype)){
                                    for(int x = 0 ; x < files.size(); x++){
                                        if(StringUtils.isNotBlank(zjid) && zjid.equals(files.get(x).getPfileid()) && "目录".equals(files.get(x).getXname())){
                                            parent = files.get(x);
                                            break;
                                        }
                                    }
                                }else if("正文".equals(pgtype)){
                                    for (Integer spiter : bmmap_zj.keySet()){
                                        if(yema >= spiter){
                                            parent = bmmap_zj.get(spiter);
                                            break;
                                        }
                                    }
                                }
                            }else if("副卷".equals(xname)){
                                if("封面".equals(pgtype)){
                                    //todo 两个封面有一个是备考表呢....?(先将两个封面都归到封面底下)
                                    for(int x = 0 ; x < files.size(); x++){
                                        if(StringUtils.isNotBlank(fjid) && fjid.equals(files.get(x).getPfileid()) && "封面".equals(files.get(x).getXname())){
                                            if(StringUtils.isNotBlank(bean.getFilename()) && bean.getFilename().indexOf("_0001") > -1){
                                                //是封面
                                                parent = files.get(x);
                                            }else {
                                                //是备考表
                                                parent = bkb_fj;
                                            }
                                            break;
                                        }
                                    }
                                }else if("目录".equals(pgtype)){
                                    for(int x = 0 ; x < files.size(); x++){
                                        if(StringUtils.isNotBlank(fjid) && fjid.equals(files.get(x).getPfileid()) && "目录".equals(files.get(x).getXname())){
                                            parent = files.get(x);
                                            break;
                                        }
                                    }
                                }else if("正文".equals(pgtype)){
                                    for (Integer spiter : bmmap_fj.keySet()){
                                        if(yema >= spiter){
                                            parent = bmmap_fj.get(spiter);
                                            break;
                                        }
                                    }
                                }
                            }
                            if(parent != null){
                                bean.setPfileid(parent.getFileid());
                                bean.setXorder(Integer.parseInt(parent.getXorder()/100000+String.valueOf(10000+yema)));
                            }
                            if(yema>0 && StringUtils.isNotBlank(bean.getPfileid())) {
                                files.add(bean);
                            }
                        }
                    }
                }
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return files;
    }

//    private void processXML(){
//        String ajid = "145100000058900";
//        List<BdMiddleFile> files = new ArrayList<BdMiddleFile>();
//        try {
//            Document document = DocumentHelper.parseText(xml);
//            org.dom4j.Element root = document.getRootElement();
//            List<org.dom4j.Element> nodes = root.elements();
//            Map<String,BdMiddleFile> jcmap = new HashMap<String, BdMiddleFile>();
//            Map<Integer,BdMiddleFile> bmmap_zj = new TreeMap<Integer, BdMiddleFile>(new MapKeyComparator());
//            Map<Integer,BdMiddleFile> bmmap_fj = new TreeMap<Integer, BdMiddleFile>(new MapKeyComparator());
//            for(int i = 0; nodes!=null && i<nodes.size();i++){
//                if("DA_SSJCXX_LIST".equals(nodes.get(i).getName())){
//                    List<org.dom4j.Element> jc = nodes.get(i).elements();
//                    int jcorder=1;
//                    //遍历卷册
//                    for(int jci = 0; jc!=null && jci<jc.size();jci++){
//                        //遍历卷册编目
//                        List<org.dom4j.Element> props =  jc.get(jci).elements();
//                        for(int p = 0 ;  props != null && p<props.size(); p++){
//                            if("JZLB".equals(props.get(p).getName())){
//                                if("正卷".equals(getCtext(props.get(p).getText())) || "副卷".equals(getCtext(props.get(p).getText())))
//                                {
//                                    BdMiddleFile fbean = new BdMiddleFile();
//                                    fbean.setFileid(IdGen.uuid());
//                                    fbean.setPfileid("0");
//                                    fbean.setXname(getCtext(props.get(p).getText()));
//                                    fbean.setAjid(ajid);
//                                    fbean.setXorder(10+jcorder);
//                                    jcorder++;
//                                    jcmap.put(fbean.getXname(),fbean);
//                                    files.add(fbean);
//                                    break;
//                                }
//                            }
//                        }
//                    }
//                    for(String key : jcmap.keySet()){
//                        //再次先插入封面(101)目录(102)备考表(900)
//                        files.add(new BdMiddleFile(IdGen.uuid(),jcmap.get(key).getFileid(),"封面",Integer.parseInt(String.valueOf(jcmap.get(key).getXorder())+"101"),ajid));
//                        files.add(new BdMiddleFile(IdGen.uuid(),jcmap.get(key).getFileid(),"目录",Integer.parseInt(String.valueOf(jcmap.get(key).getXorder())+"102"),ajid));
//                        files.add(new BdMiddleFile(IdGen.uuid(),jcmap.get(key).getFileid(),"备考表",Integer.parseInt(String.valueOf(jcmap.get(key).getXorder())+"900"),ajid));
//                    }
//                }else if ("DA_SSJCBM_LIST".equals(nodes.get(i).getName())){
//                    List<org.dom4j.Element> bm = nodes.get(i).elements();
//                    int bmorder=3;
//                    for(int bmi = 0; bm!=null && bmi<bm.size();bmi++){
//                        BdMiddleFile fbean = new BdMiddleFile();
//                        List<org.dom4j.Element> props =  bm.get(bmi).elements();
//                        for(int p = 0 ;  props != null && p<props.size(); p++){
//                            if("JZLB".equals(props.get(p).getName())){
//                                fbean.setJzlb(getCtext(props.get(p).getText()));
//                                fbean.setPfileid(jcmap.get(getCtext(props.get(p).getText())).getFileid());
//                                fbean.setXorder(Integer.parseInt(String.valueOf(jcmap.get(getCtext(props.get(p).getText())).getXorder()) + String.valueOf(100+bmorder)));
//                            }else if("CLBT".equals(props.get(p).getName())){
//                                fbean.setFileid(IdGen.uuid());
//                                fbean.setXname(getCtext(props.get(p).getText()));
//                                fbean.setAjid(ajid);
//                                bmorder++;
//                            }else if("P1".equals(props.get(p).getName())){
//                                try {
//                                    if("正卷".equals(fbean.getJzlb())){
//                                        bmmap_zj.put(Integer.parseInt(getCtext(props.get(p).getText())), fbean);
//                                    }else if("副卷".equals(fbean.getJzlb())){
//                                        bmmap_fj.put(Integer.parseInt(getCtext(props.get(p).getText())), fbean);
//                                    }
//                                }catch (Exception ex){
//                                    ex.printStackTrace();
//                                }
//                                files.add(fbean);
//                            }
//                        }
//                    }
//                }else if ("DA_SSJCYX_LIST".equals(nodes.get(i).getName())){
////                    List<BdMiddleFile> ymitems = new ArrayList<BdMiddleFile>();
//                    List<org.dom4j.Element> ym = nodes.get(i).elements();
//                    int ymorder=1;
//                    for(int ymi = 0; ym!=null && ymi<ym.size();ymi++){
//                        BdMiddleFile fbean = new BdMiddleFile();
//                        List<org.dom4j.Element> props =  ym.get(ymi).elements();
//                        for(int p = 0 ;  props != null && p<props.size(); p++){
//                            if("JZLB".equals(props.get(p).getName())) {
//                                fbean.setJzlb(getCtext(props.get(p).getText()));
//                            }else if("PGTYPE".equals(props.get(p).getName())){
//                                fbean.setPgtype(getCtext(props.get(p).getText()));
//                            }else if("YEMA".equals(props.get(p).getName())){
////                                if("正卷".equals())
//                                fbean.setFileid(IdGen.uuid());
//                                int yema = 0;
//                                try{
//                                    yema = Integer.parseInt(getCtext(props.get(p).getText()));
//                                }catch (Exception ex){ex.printStackTrace();}
//                                fbean.setXname(String.valueOf(yema));
//                                if("正文".equals(fbean.getPgtype())){
//                                    if("正卷".equals(fbean.getJzlb())){
//                                        for (Integer spiter : bmmap_zj.keySet()){
//                                            if(yema >= spiter){
//                                                fbean.setPfileid(bmmap_zj.get(spiter).getFileid());
//                                                fbean.setXorder(Integer.parseInt(String.valueOf(bmmap_zj.get(spiter).getXorder()) + String.valueOf(10000+ymorder)));
//                                                break;
//                                            }
//                                        }
//                                    }else if ("副卷".equals(fbean.getJzlb())){
//                                        for (Integer spiter : bmmap_fj.keySet()){
//                                            if(yema >= spiter){
//                                                fbean.setPfileid(bmmap_fj.get(spiter).getFileid());
//                                                fbean.setXorder(Integer.parseInt(String.valueOf(bmmap_fj.get(spiter).getXorder()) + String.valueOf(10000+ymorder)));
//                                                break;
//                                            }
//                                        }
//                                    }
//                                }else if ("封面".equals(fbean.getPgtype())){
//                                    if("正卷".equals(fbean.getJzlb())){
//                                        fbean.setPfileid(files.get(2).getFileid());
//                                        fbean.setXorder(Integer.parseInt(String.valueOf(files.get(2).getXorder()) + String.valueOf(10000+ymorder)));
//                                    }else if("副卷".equals(fbean.getJzlb())){
//                                        fbean.setPfileid(files.get(5).getFileid());
//                                        fbean.setXorder(Integer.parseInt(String.valueOf(files.get(5).getXorder()) + String.valueOf(10000+ymorder)));
//                                    }
//                                }else if ("目录".equals(fbean.getPgtype())){
//                                    if("正卷".equals(fbean.getJzlb())){
//                                        fbean.setPfileid(files.get(3).getFileid());
//                                        fbean.setXorder(Integer.parseInt(String.valueOf(files.get(3).getXorder()) + String.valueOf(10000+ymorder)));
//                                    }else if("副卷".equals(fbean.getJzlb())){
//                                        fbean.setPfileid(files.get(6).getFileid());
//                                        fbean.setXorder(Integer.parseInt(String.valueOf(files.get(6).getXorder()) + String.valueOf(10000+ymorder)));
//                                    }
//                                }else if ("备考表".equals(fbean.getPgtype())){
//                                    if("正卷".equals(fbean.getJzlb())){
//                                        fbean.setPfileid(files.get(4).getFileid());
//                                        fbean.setXorder(Integer.parseInt(String.valueOf(files.get(4).getXorder()) + String.valueOf(10000+ymorder)));
//                                    }else if("副卷".equals(fbean.getJzlb())){
//                                        fbean.setPfileid(files.get(7).getFileid());
//                                        fbean.setXorder(Integer.parseInt(String.valueOf(files.get(7).getXorder()) + String.valueOf(10000+ymorder)));
//                                    }
//                                }
//                                fbean.setAjid(ajid);
//                            }
//                        }
//                    }
//                }
//            }
//        }catch (Exception ex){
//            ex.printStackTrace();
//        }
////        for
//        System.out.println(files.size());
//    }

    private String getCtext(String otext){
        if(StringUtils.isNotBlank(otext)){
            return new String(Base64.decodeBase64(otext));
        }
        return "";
    }

    public void doJob(String path){
//        List<BdMiddleFile> files = convertFilesByXML(xml);
//        for(BdMiddleFile f : files){
//            f.setAjid("145100000058900");
//            int i = wsService.insertFile(f);
////            System.out.println(i);
//        }
//        processXML();
//        try {
////            String xml = wsService.wsGetOneFileContent(0, "2017/1201/145100000065779/Z_1/20170626.085335.210_0005.tif", "ahgy_ftp", "340000");
//            String xml = wsService.wsGetOneFileContent(0, "2017/1201/145100000065779/Z_1/20170626.085335.179_0003.JPG", "ahgy_ftp", "340000");
//            String content = getFileContent(xml);
//
//            byte[] data = Base64.decodeBase64(content.getBytes());
//            FileOutputStream imageOutput = new FileOutputStream(path+"3.tif");
//            imageOutput.write(data, 0, data.length);
//            imageOutput.close();
//        }catch (Exception ex){
//            ex.printStackTrace();
//        }

//            //了解档案的分布式规则。
//            String ah = "(2017)皖刑终4号";
//            String fycode= "340000";
//            String xml = wsService.wsGetOneFileInfo(0,ah,fycode);//invokeFileInfoByAh(getFbsxhByFyCode(fycode),ah,fycode);
//            System.out.println(xml);

    }


    public String getFileContent(String text){
        Pattern pattern = Pattern.compile("(?<=<FileContent>)[\\s\\S]+(?=</FileContent>)");//("(?<=<c)\\d+(?=>)");//("^<Data\\w*>$");//(?<=\<)\.*(?=\>)
        Matcher matcher = pattern.matcher(text);
        if(matcher.find()){
            try{
                return new String(matcher.group());
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        return "";
    }

    private String getByRegex(String text,String regex){
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(text);
        if(matcher.find()) {
            String value = new String(Base64.decodeBase64(matcher.group()));
            if(StringUtils.isNotBlank(value) && StringUtils.isNotBlank(StringUtils.trim(value))) {
                return StringUtils.trim(value);
            }
        }
        return null;
    }
}
