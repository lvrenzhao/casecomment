package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.BdMiddleCase;
import cn.gov.ahcourt.casecomment.bean.WsAj;
import cn.gov.ahcourt.casecomment.bean.WsAjid;
import cn.gov.ahcourt.casecomment.mapper.BdMiddleCaseMapper;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lvrenzhao on 2017/10/19.
 */
@Service
public class JobCaseFetcher {
    @Resource
    private WSService wsService;
    @Resource
    private BdMiddleCaseMapper bdMiddleCaseMapper;

    public void doJob(){
        String begintime = wsService.getTaskBeginTime();
        if(StringUtils.isNotBlank(begintime)) {
            System.out.println("$开始提取有效案件（归档案件）.....");
            for(int f = 0 ; f <WSService.FYCODE.length ; f ++){
                String fjm = WSService.FYCODE[f];
                int pagesize = 1000;
                int t_page = wsService.getAllNeedFetchPage(fjm,begintime, pagesize);
                for (int i = 0; i < t_page; i++) {
                    List<WsAj> ls = wsService.getNeedFetchByPage(fjm,begintime, i * pagesize, pagesize);
                    for (int l = 0; ls != null && l < ls.size(); l++) {
                        WsAj item = ls.get(l);
                        BdMiddleCase bean = bdMiddleCaseMapper.selectByPrimaryKey(item.getTdhajid());
                        Boolean isNew = true;
                        if(bean == null){
                            bean =  new BdMiddleCase();
                            bean.setAjid(item.getTdhajid());
                            bean.setPasscheck("0");
                            bean.setCreateDate(DateFormatUtils.ISO_DATETIME_FORMAT.format(new Date()));
                            bean.setRelatedcasecount(0);
                        }else{
                            isNew=false;
                            bean.setUpdateDate(DateFormatUtils.ISO_DATETIME_FORMAT.format(new Date()));
                        }
                        bean.setAh(item.getAh());
                        bean.setGsfy(getByRegex(item.getXmlbase(),"(?<=<FYDMMS>)\\S+(?=</FYDMMS>)"));
                        bean.setCbbm(getByRegex(item.getXmlbase(),"(?<=<CBBMMS>)\\S+(?=</CBBMMS>)"));
                        bean.setCbr(getByRegex(item.getXmlbase(),"(?<=<CBRMS>)\\S+(?=</CBRMS>)"));

                        bean.setXz(getXz(item.getXmlbase()));
                        bean.setAy(getByRegex(item.getXmlbase(),"(?<=<AYMS>)\\S+(?=</AYMS>)"));
                        bean.setJafs(getByRegex(item.getXmlbase(),"(?<=<JAFSMS>)\\S+(?=</JAFSMS>)"));
                        if(StringUtils.isNotBlank(item.getJarq()) && StringUtils.isNotBlank(StringUtils.trim(item.getJarq()))) {
                            bean.setJasj(StringUtils.trim(item.getJarq()));
                        }
                        bean.setLx(getLx(item.getXmlbase()));
                        bean.setThirdid(getByRegex(item.getXmlbase(),"(?<=<YSAH>)\\S+(?=</YSAH>)"));//原审案号
                        try {
                            if (isNew) {
                                bdMiddleCaseMapper.insert(bean);
                            } else {
                                bdMiddleCaseMapper.updateByPrimaryKey(bean);
                            }
                        }catch (Exception ex){
                            ex.printStackTrace();
                        }
                    }
                }
            }

        }

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

    private String getXz(String xml){
        int ajlx = 0;
        try {
            ajlx = Integer.parseInt(getByRegex(xml, "(?<=<AJLX>)\\S+(?=</AJLX>)"));
        }catch (Exception ex){
            ex.printStackTrace();
        }
        if(ajlx>=11 && ajlx <=19){
            return "刑事";
        }else if(ajlx>=21 && ajlx<=29){
            return "民事";
        }else if(ajlx>=31 && ajlx<=39){
            return "行政";
        }else if(ajlx>=41 && ajlx<=49){
            return "赔偿";
        }else if(ajlx>=51 && ajlx<=59){
            return "执行";
        }else{
            return "其他";
        }
    }
    private String getLx(String xml){
        String jafsmc = getByRegex(xml, "(?<=<JAFSMS>)\\S+(?=</JAFSMS>)");
        String ah = getByRegex(xml, "(?<=<AH>)\\S+(?=</AH>)");
        int jarq = 0;
        int larq = 0;
        int ajlx = 0;
        try {
            jarq = Integer.parseInt(getByRegex(xml, "(?<=<JARQ>)\\S+(?=</JARQ>)"));
        }catch (Exception ex){
            ex.printStackTrace();
        }
        try {
            larq = Integer.parseInt(getByRegex(xml, "(?<=<LARQ>)\\S+(?=</LARQ>)"));
        }catch (Exception ex){
            ex.printStackTrace();
        }
        try {
            ajlx = Integer.parseInt(getByRegex(xml, "(?<=<AJLX>)\\S+(?=</AJLX>)"));
        }catch (Exception ex){
            ex.printStackTrace();
        }
        String ajlxmc = getByRegex(xml, "(?<=<AJLXMC>)\\S+(?=</AJLXMC>)");
        if(ah !=null && ah.indexOf("抗") > -1){
            return "抗诉";
        }else if(jafsmc != null && (jafsmc.indexOf("维持")>-1 || jafsmc.indexOf("改判")>-1)){
            return "发回改判";
        }else if(ajlx == 13 || ajlx == 23 || ajlx == 33){
            return "再审";
        }else if(ajlx == 52 || ajlx == 77){
            return "执行异议复议";
        }else if (jarq - larq > 540){
            return "审理周期超过一年半以上";
        }
        return "";
    }


}
