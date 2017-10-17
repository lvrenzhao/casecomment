package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.BdMiddleCase;
import cn.gov.ahcourt.casecomment.bean.WsCaseInfo;
import cn.gov.ahcourt.casecomment.mapper.BdMiddleCaseMapper;
import cn.gov.ahcourt.casecomment.mapper.WsCaseInfoMapper;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.apache.axiom.om.OMAbstractFactory;
import org.apache.axiom.om.OMElement;
import org.apache.axiom.om.OMFactory;
import org.apache.axiom.om.OMNamespace;
import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.codec.binary.Base64;

import javax.annotation.Resource;
import javax.xml.namespace.QName;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
@Service
public class WSService {

    @Resource
    private BdMiddleCaseMapper bdMiddleCaseMapper;

    @Resource
    private WsCaseInfoMapper wsCaseInfoMapper;

//    @Resource
//    private WsTaskMapper wsTaskMapper;
//
//    @Resource
//    private WsTaskItemsMapper wsTaskItemsMapper;
//
//    @Resource
//    private WsLogMapper wsLogMapper;

    public static final String WEBSERVICE_BASE = "http://139.1.1.129:81/court/service/SzftWebService";
    public static final String WEBSERVICE_BASE_NS = "http://szft.tdh/";
    public static final String WEBSERVICE_BASE_UN = "dic";
    public static final String WEBSERVICE_BASE_PW = "dic";
    private static final String WEBSERVICE_BASE_STARTDATE = "2016-01-01";
    private static final String WEBSERVICE_BASE_ENDDATE = "2017-12-31";
    public static final String[] WEBSERVICE_FILE_FBS = {"http://139.1.1.130:99/dagl/service/TDHYxxxService","http://139.1.1.130:98/dagl/service/TDHYxxxService","http://139.1.1.130:97/dagl/service/TDHYxxxService"};//(注意：这里是分布式)
    public static final String WEBSERVICE_FILE_NS = "http://web.service.tdh/";
    public static final String WEBSERVICE_FILE_UN = "";
    public static final String WEBSERVICE_FILE_PW = "";
    public static final String HTTPSERVICE_VIDEO = "http://139.0.90.103:8080/imp/DataExtraction";
    public static final String WEBSERVICE_VIDEO_UN = "tydk";
    public static final String WEBSERVICE_VIDEO_PW = "tydk";

//    public static final String[] FYCODE={"C00","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C1A","C1B","C20","C21","C22","C24","C25","C26","C27","C28","C2A","C29","C30","C31","C32","C33","C34","C35","C36","C37","C40","C41","C42","C43","C44","C45","C46","C47","C50","C57","C52","C53","C54","C55","C56","C60","C61","C62","C63","C64","C70","C71","C72","C76","C74","C73","C74","C75","C80","C81","C82","C83","C84","C85","C86","C87","C88","C89","C8A","C8B","C90","C91","C92","C93","C94","C95","C96","C97","CC0","CC1","CC8","CC2","CC7","CC3","CC4","CC5","CC6","CA0","CA1","CA2","CA3","CA4","CA7","CA8","CAB","CAC","CB0","CB1","CB2","CB3","CB4","CB5","CD0","CD1","CD2","CD3","CD4","CD5","CD6","CD7","CD8","CE0","CE1","CE2","CE3","CE4","CE5","CE6","CE7","CG0","CG1","CG2","CG3","CG4","CG5","CH0","CH1","CH2","CH3","CH4"};
    public static final String[] FYCODE = {"C00","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C1A","C1B","C20","C21","C22","C24","C25","C26","C27","C28","C29","C2A","C30","C31","C32","C33","C34","C35","C36","C37","C40","C41","C42","C43","C44","C45","C46","C47","C50","C52","C53","C54","C55","C56","C57","C60","C61","C62","C63","C64","C70","C71","C72","C73","C74","C75","C76","C77","C80","C81","C82","C83","C84","C85","C86","C87","C88","C89","C8A","C8B","C90","C91","C92","C93","C94","C95","C96","C97","CA0","CA1","CA2","CA3","CA4","CA7","CA8","CAB","CAC","CB0","CB1","CB2","CB3","CB4","CB5","CC0","CC1","CC2","CC3","CC4","CC5","CC6","CC7","CC8","CD0","CD1","CD2","CD3","CD4","CD5","CD6","CD7","CD8","CE0","CE1","CE2","CE3","CE4","CE5","CE6","CE7","CG0","CG1","CG2","CG3","CG4","CG5","CH0","CH1","CH2","CH3","CH4"};
    public static final String[] FYDM  ={"340000","340100","340102","340103","340104","340111","340121","340122","340123","340141","340192","340193","340194","340200","340202","340203","340205","340221","340222","340223","340224","340291","340231","340300","340302","340303","340304","340311","340321","340322","340323","340400","340402","340403","340404","340405","340406","340421","340422","340500","340503","340504","340521","340591","340592","340502","340600","340602","340603","340604","340621","340700","340702","340703","340711","340706","340722","340705","340721","340800","340802","340803","340811","340821","340822","340823","340824","340825","340826","340827","340828","341000","341001","341002","341003","341021","341022","341023","341024","341200","341203","341213","341222","341223","341227","341228","341229","341230","342200","342201","342221","342222","342224","342225","341100","341101","341111","341121","341122","341123","341124","341112","341103","342400","342401","342422","342423","342425","342426","342427","342428","342429","342500","342501","342522","342523","342524","342526","342527","342529","342800","342811","342821","342822","342823","342831","342900","342901","342902","342903","342904"};


    ServiceClient sender;

    public WSService(){
        try{
            sender = new ServiceClient();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }


    /**
     * 根据法院分级码下载该院建国以来的所有案件标识号(每页1000条，分页下载)
     * @param fjm 法院分级码
     * @param page 页码
     * @param today 今天 格式 yyyymmdd
     * @return
     */
    public String wsGetAllAJID(String fjm,String today,int page){
        try {
            if(sender != null && StringUtils.isNotBlank(fjm) && StringUtils.isNotBlank(today)){
                today = "19491001-"+today;
                EndpointReference endpointReference = new EndpointReference(WSService.WEBSERVICE_BASE);
                Options options = new Options();
                options.setTimeOutInMilliSeconds(200*60*1000);
                options.setTo(endpointReference);
                sender.setOptions(options);
                OMFactory fac = OMAbstractFactory.getOMFactory();
                OMNamespace omNs = fac.createOMNamespace(WSService.WEBSERVICE_BASE_NS,  "");
                OMElement method = fac.createOMElement("getPlAjbs", omNs);
                String[] paramnames = new String[] { "Uid","Pwd","XML" };
                String xml = "<Request><FJM>"+new String(Base64.encodeBase64(fjm.getBytes("UTF-8")))+"</FJM><LARQ>"+new String(Base64.encodeBase64(today.getBytes("UTF-8")))+"</LARQ><C_PageNum>"+new String(Base64.encodeBase64(String.valueOf(page).getBytes("UTF-8")))+"</C_PageNum></Request>";
                String p3text = new String(Base64.encodeBase64(xml.getBytes("UTF-8")));
                String[] paramvalues = new String[] { WSService.WEBSERVICE_BASE_UN,WSService.WEBSERVICE_BASE_PW,p3text };
                for (int i = 0; i < paramnames.length; i++) {
                    QName qname=new QName(paramnames[i]);
                    OMElement inner = fac.createOMElement(qname);
                    inner.setText(paramvalues[i]);
                    method.addChild(inner);
                }
                // 发送数据，返回结果
                OMElement result = sender.sendReceive(method);
                return new String(Base64.decodeBase64(result.getFirstElement().getText()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取今天更新的ajid
     * @param fjm 法院分级码
     * @param zdsj 指定时间
     * @return
     */
    public String wsGetUpdateAJID(String zdsj,String fjm){
        try {
            if(sender != null && StringUtils.isNotBlank(fjm) && StringUtils.isNotBlank(zdsj)){
                EndpointReference endpointReference = new EndpointReference(WSService.WEBSERVICE_BASE);
                Options options = new Options();
                options.setTimeOutInMilliSeconds(200*60*1000);
                options.setTo(endpointReference);
                sender.setOptions(options);
                OMFactory fac = OMAbstractFactory.getOMFactory();
                OMNamespace omNs = fac.createOMNamespace(WSService.WEBSERVICE_BASE_NS,  "");
                OMElement method = fac.createOMElement("GetGxajByZdsj", omNs);
                String[] paramnames = new String[] { "Userid","Pwd","RequestXML" };
                String xml = "<Request><FY>"+new String(Base64.encodeBase64(fjm.getBytes("UTF-8")))+"</FY><ZDSJ>"+new String(Base64.encodeBase64(zdsj.getBytes("UTF-8")))+"</ZDSJ></Request>";
                String p3text = new String(Base64.encodeBase64(xml.getBytes("UTF-8")));
                String[] paramvalues = new String[] { WSService.WEBSERVICE_BASE_UN,WSService.WEBSERVICE_BASE_PW,p3text };
                for (int i = 0; i < paramnames.length; i++) {
                    QName qname=new QName(paramnames[i]);
                    OMElement inner = fac.createOMElement(qname);
                    inner.setText(paramvalues[i]);
                    method.addChild(inner);
                }
                // 发送数据，返回结果
                OMElement result = sender.sendReceive(method);
                return new String(Base64.decodeBase64(result.getFirstElement().getText()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public String wsGetOneBaseInfo(String tdhajid){
        try {
            if(sender != null && StringUtils.isNotBlank(tdhajid)){
                String soapBindingAddress = WSService.WEBSERVICE_BASE;
                EndpointReference endpointReference = new EndpointReference(soapBindingAddress);
                Options options = new Options();
                options.setTimeOutInMilliSeconds(200*60*1000);
                options.setTo(endpointReference);
                sender.setOptions(options);
                OMFactory fac = OMAbstractFactory.getOMFactory();
                OMNamespace omNs = fac.createOMNamespace(WSService.WEBSERVICE_BASE_NS,  "");
                OMElement method = fac.createOMElement("GetPlAj", omNs);
                String[] paramnames = new String[] { "Userid","Pwd","RequestXML" };
                String xml = "<Request><AHDM>"+new String(new String(Base64.encodeBase64(tdhajid.getBytes("UTF-8"))))+"</AHDM></Request>";
                String p3text = new String(Base64.encodeBase64(xml.getBytes("UTF-8")));
                String[] paramvalues = new String[] { WSService.WEBSERVICE_BASE_UN,WSService.WEBSERVICE_BASE_PW,p3text };
                for (int i = 0; i < paramnames.length; i++) {
                    QName qname=new QName(paramnames[i]);
                    OMElement inner = fac.createOMElement(qname);
                    inner.setText(paramvalues[i]);
                    method.addChild(inner);
                }
                // 发送数据，返回结果
                OMElement result = sender.sendReceive(method);
                return new String(Base64.decodeBase64(result.getFirstElement().getText()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public String wsGetOneFileInfo(int fbsxh,String ah,String fycode){
        try {
            if(sender != null && StringUtils.isNotBlank(ah) && StringUtils.isNotBlank(fycode)){
                String soapBindingAddress = WSService.WEBSERVICE_FILE_FBS[fbsxh];
                EndpointReference endpointReference = new EndpointReference(soapBindingAddress);
                Options options = new Options();
                options.setTimeOutInMilliSeconds(200*60*1000);
                options.setTo(endpointReference);
                sender.setOptions(options);
                OMFactory fac = OMAbstractFactory.getOMFactory();
                OMNamespace omNs = fac.createOMNamespace(WSService.WEBSERVICE_FILE_NS,  "");
                OMElement method = fac.createOMElement("GetYxTmInfo", omNs);
                String[] paramnames = new String[] { "Userid","Pwd","Ah","Fydm" };
                String[] paramvalues = new String[] { new String(Base64.encodeBase64(WSService.WEBSERVICE_FILE_UN.getBytes("UTF-8"))), new String(Base64.encodeBase64(WSService.WEBSERVICE_FILE_PW.getBytes("UTF-8"))),new String(Base64.encodeBase64(ah.getBytes("UTF-8"))),new String(Base64.encodeBase64(fycode.getBytes("UTF-8")))};
                for (int i = 0; i < paramnames.length; i++) {
                    QName qname=new QName(paramnames[i]);
                    OMElement inner = fac.createOMElement(qname);
                    inner.setText(paramvalues[i]);
                    method.addChild(inner);
                }
                // 发送数据，返回结果
                OMElement result = sender.sendReceive(method);
                return new String(Base64.decodeBase64(result.getFirstElement().getText()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public String wsGetOneFileContent(int fbsxh,String FILENAME,String FTPSERVER,String FYDM){
        try {
            if(sender != null && StringUtils.isNotBlank(FILENAME) && StringUtils.isNotBlank(FTPSERVER) && StringUtils.isNotBlank(FYDM)){
                String soapBindingAddress = WSService.WEBSERVICE_FILE_FBS[fbsxh];
                EndpointReference endpointReference = new EndpointReference(soapBindingAddress);
                Options options = new Options();
                options.setTimeOutInMilliSeconds(200*60*1000);
                options.setTo(endpointReference);
                sender.setOptions(options);
                OMFactory fac = OMAbstractFactory.getOMFactory();
                OMNamespace omNs = fac.createOMNamespace(WSService.WEBSERVICE_FILE_NS,  "");
                OMElement method = fac.createOMElement("GetYxFile", omNs);
                String param3 =
                        "<Request>" +
                                "<FYDM>"+new String(Base64.encodeBase64(FYDM.getBytes("UTF-8")))+"</FYDM>" +
                                "<FILENAME>"+new String(Base64.encodeBase64(FILENAME.getBytes("UTF-8")))+"</FILENAME>" +
                                "<FTPSERVER>"+new String(Base64.encodeBase64(FTPSERVER.getBytes("UTF-8")))+"</FTPSERVER>" +
                                "</Request>";
                String[] paramnames = new String[] { "Userid","Pwd","Xml"};
                String[] paramvalues = new String[] { new String(Base64.encodeBase64(WSService.WEBSERVICE_FILE_UN.getBytes("UTF-8"))), new String(Base64.encodeBase64(WSService.WEBSERVICE_FILE_PW.getBytes("UTF-8"))),new String(Base64.encodeBase64(param3.getBytes("UTF-8")))};
                for (int i = 0; i < paramnames.length; i++) {
                    QName qname=new QName(paramnames[i]);
                    OMElement inner = fac.createOMElement(qname);
                    inner.setText(paramvalues[i]);
                    method.addChild(inner);
                }
                // 发送数据，返回结果
                OMElement result = sender.sendReceive(method);
//                System.out.println(result.getFirstElement().getText());
                return new String(Base64.decodeBase64(result.getFirstElement().getText()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    //==========================所有老方法（不再推荐使用）============================

    /**
     * 仅获取基本信息接口的中所有ajid的列表。
     * @param page
     * @return
     */
//    public String invokeBaseInfoOnlyTdhAjid(int page){
//        try {
//            if(sender != null ){
//                String soapBindingAddress = WSService.WEBSERVICE_BASE;
//                EndpointReference endpointReference = new EndpointReference(soapBindingAddress);
//                Options options = new Options();
//                options.setTimeOutInMilliSeconds(200*60*1000);
//                options.setTo(endpointReference);
//                sender.setOptions(options);
//                OMFactory fac = OMAbstractFactory.getOMFactory();
//                OMNamespace omNs = fac.createOMNamespace(WSService.WEBSERVICE_BASE_NS,  "");
//                OMElement method = fac.createOMElement("getPlAjbs", omNs);
//                String[] paramnames = new String[] { "Uid","Pwd","XML" };
//                String xml = "<Request><FJM>"+new String(Base64.encodeBase64("C10".getBytes("UTF-8")))+"</FJM><LARQ>"+new String(Base64.encodeBase64("19491001-20171231".getBytes("UTF-8")))+"</LARQ></Request>";
//                String p3text = new String(Base64.encodeBase64(xml.getBytes("UTF-8")));
//                String[] paramvalues = new String[] { WSService.WEBSERVICE_BASE_UN,WSService.WEBSERVICE_BASE_PW,p3text };
//                for (int i = 0; i < paramnames.length; i++) {
//                    QName qname=new QName(paramnames[i]);
//                    OMElement inner = fac.createOMElement(qname);
//                    inner.setText(paramvalues[i]);
//                    method.addChild(inner);
//                }
//                // 发送数据，返回结果
//                OMElement result = sender.sendReceive(method);
//                return new String(Base64.decodeBase64(result.getFirstElement().getText()));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }


    /**
     * 模糊查询案件列表，根据法院分级码和结案时间段(方法存在漏案情况，不建议使用)
     * @param fycode
     * @param span
     * @return
     */
//    public String invokeBaseInfoByTimeSpan(String fycode,String span){
//        try {
//            if(sender != null && StringUtils.isNotBlank(span)){
//                String soapBindingAddress = WSService.WEBSERVICE_BASE;
//                EndpointReference endpointReference = new EndpointReference(soapBindingAddress);
//                Options options = new Options();
//                options.setTimeOutInMilliSeconds(200*60*1000);
//                options.setTo(endpointReference);
//                sender.setOptions(options);
//                OMFactory fac = OMAbstractFactory.getOMFactory();
//                OMNamespace omNs = fac.createOMNamespace(WSService.WEBSERVICE_BASE_NS,  "");
//                OMElement method = fac.createOMElement("GetPlAj", omNs);
//                String[] paramnames = new String[] { "Userid","Pwd","RequestXML" };
//                String xml = "<Request><FYDM>"+new String(new String(Base64.encodeBase64(fycode.getBytes("UTF-8"))))+"</FYDM><JARQ>"+new String(new String(Base64.encodeBase64(span.getBytes("UTF-8"))))+"</JARQ><ZT>"+new String(new String(Base64.encodeBase64("1".getBytes("UTF-8"))))+"</ZT></Request>";
//                String p3text = new String(Base64.encodeBase64(xml.getBytes("UTF-8")));
//                String[] paramvalues = new String[] { WSService.WEBSERVICE_BASE_UN,WSService.WEBSERVICE_BASE_PW,p3text };
//                for (int i = 0; i < paramnames.length; i++) {
//                    QName qname=new QName(paramnames[i]);
//                    OMElement inner = fac.createOMElement(qname);
//                    inner.setText(paramvalues[i]);
//                    method.addChild(inner);
//                }
//                // 发送数据，返回结果
//                OMElement result = sender.sendReceive(method);
//                return new String(Base64.decodeBase64(result.getFirstElement().getText()));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }

    public static List<String> findDates(String sbegin, String send)
    {
        List lDate = new ArrayList();
        Date dBegin ;
        Date dEnd;
        try{
            dBegin = new SimpleDateFormat("yyyyMMdd").parse(sbegin);
            dEnd = new SimpleDateFormat("yyyyMMdd").parse(send);
        }catch (Exception ex){
            return lDate;
        }
        Calendar calBegin = Calendar.getInstance();
        calBegin.setTime(dBegin);
        Calendar calEnd = Calendar.getInstance();
        calEnd.setTime(dEnd);
        while (dEnd.after(calBegin.getTime()))
        {
            String now = new SimpleDateFormat("yyyyMMdd").format(calBegin.getTime());
            lDate.add(now+"-"+now);
//            calBegin.add(Calendar.DAY_OF_MONTH, 5);
//            lDate.add(now+"-"+new SimpleDateFormat("yyyyMMdd").format(calBegin.getTime()));
            calBegin.add(Calendar.DAY_OF_MONTH, 1);
        }
        return lDate;
    }



//    public int insertTask(WsTask task){
//        try {
//            return wsTaskMapper.insert(task);
//        }catch (Exception ex){
//            return 0;
//        }
//    }
//
//    public int updateTask(WsTask task){
//        try {
//            return wsTaskMapper.updateByPrimaryKey(task);
//        }catch (Exception ex){
//            return 0;
//        }
//    }
//
//    public int insertTaskItem(WsTaskItems item){
//        try {
//            return wsTaskItemsMapper.insert(item);
//        }catch(Exception ex){
//            return 0;
//        }
//    }
//
//    public int updateTaskItem(WsTaskItems item){
//        try {
//            return wsTaskItemsMapper.updateByPrimaryKey(item);
//        }catch (Exception ex){
//            return 0;
//        }
//    }
//
//    public int insertLog(WsLog item){
//        try {
//            return wsLogMapper.insert(item);
//        }catch (Exception ex){
//            return 0;
//        }
//    }
//
//    public int updateLog(WsLog item){
//        try {
//            return wsLogMapper.updateByPrimaryKey(item);
//        }catch (Exception ex){
//            return 0;
//        }
//    }

    public int insertCaseInfo(WsCaseInfo item){
        try{
            return wsCaseInfoMapper.insert(item);
        }catch (Exception ex){
            return 0;
        }
    }


    public static int getAllCount(String text){
        Pattern pattern = Pattern.compile("(?<=<Data Count=\")\\S+(?=\"\\s*>)");//("(?<=<c)\\d+(?=>)");//("^<Data\\w*>$");//(?<=\<)\.*(?=\>)
        Matcher matcher = pattern.matcher(text);
        if(matcher.find()){
            try{
                return Integer.parseInt(new String(Base64.decodeBase64(matcher.group())));
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        return 0;
    }

    public static int getT_PageNum(String text){
        Pattern pattern = Pattern.compile("(?<=T_PageNum=\")\\S+(?=\")");//("(?<=<c)\\d+(?=>)");//("^<Data\\w*>$");//(?<=\<)\.*(?=\>)
        Matcher matcher = pattern.matcher(text);
        if(matcher.find()){
            try{
                return Integer.parseInt(new String(Base64.decodeBase64(matcher.group())));
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        return 0;
    }


    public int getFbsxhByFyCode(String fycode){
        String[] server0 = {"340000","340100","340102","340103","340104","340111","340121","340122","340123","340141","340192","340193","340194","340500","340502","340503","340504","340521","340591","340592","340700","340702","340703","340705","340706","340711","340721","340722","341000","341001","341002","341003","341021","341022","341023","341024","342800","342811","342821","342822","342823","342831"};
        String[] server1 = {"340300","340302","340303","340304","340311","340321","340322","340323","340400","340402","340403","340404","340405","340406","340421","340422","340600","340602","340603","340604","340621","341200","341203","341213","341222","341223","341227","341228","341229","341230","342200","342201","342221","342222","342224","342225","342900","342901","342902","342903","342904"};
        String[] server2 = {"340200","340202","340203","340205","340221","340222","340223","340224","340231","340291","340800","340802","340803","340811","340821","340822","340823","340824","340825","340826","340827","340828","341100","341101","341103","341111","341112","341121","341122","341123","341124","342400","342401","342422","342423","342425","342426","342427","342428","342429","342500","342501","342522","342523","342524","342526","342527","342529"};

        int i = indexOfArr(server0,fycode);
        if(i > -1){
            return 0;
        }

        i = indexOfArr(server1,fycode);
        if(i > -1){
            return 1;
        }

        i = indexOfArr(server2,fycode);
        if(i> -1){
            return 2;
        }

        return 0;
    }


    public static int indexOfArr(String[] arr,String value2){
        for(int i=0;i<arr.length;i++){
            if(arr[i].equals(value2)){
                return i;
            }
        }
        return -1;
    }
}
