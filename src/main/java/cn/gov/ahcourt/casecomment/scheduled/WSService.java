package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.BdMiddleCase;
import cn.gov.ahcourt.casecomment.bean.WsLog;
import cn.gov.ahcourt.casecomment.bean.WsTask;
import cn.gov.ahcourt.casecomment.bean.WsTaskItems;
import cn.gov.ahcourt.casecomment.mapper.BdMiddleCaseMapper;
import cn.gov.ahcourt.casecomment.mapper.WsLogMapper;
import cn.gov.ahcourt.casecomment.mapper.WsTaskItemsMapper;
import cn.gov.ahcourt.casecomment.mapper.WsTaskMapper;
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
    private WsTaskMapper wsTaskMapper;

    @Resource
    private WsTaskItemsMapper wsTaskItemsMapper;

    @Resource
    private WsLogMapper wsLogMapper;

    public static final String WEBSERVICE_BASE = "http://139.1.1.19:81/court/service/SzftWebService";
    public static final String WEBSERVICE_BASE_NS = "http://szft.tdh/";
    public static final String WEBSERVICE_BASE_UN = "dic";
    public static final String WEBSERVICE_BASE_PW = "dic";
    private static final String WEBSERVICE_BASE_STARTDATE = "2016-01-01";
    private static final String WEBSERVICE_BASE_ENDDATE = "2017-12-31";
    public static final String WEBSERVICE_FILE = "http://139.1.1.130:99/dagl/service/TDHYxxxService?wsdl";
    public static final String WEBSERVICE_VIDEO = "";
//    public static final String[] FYCODE={"C00","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C1A","C1B","C20","C21","C22","C24","C25","C26","C27","C28","C2A","C29","C30","C31","C32","C33","C34","C35","C36","C37","C40","C41","C42","C43","C44","C45","C46","C47","C50","C57","C52","C53","C54","C55","C56","C60","C61","C62","C63","C64","C70","C71","C72","C76","C74","C73","C74","C75","C80","C81","C82","C83","C84","C85","C86","C87","C88","C89","C8A","C8B","C90","C91","C92","C93","C94","C95","C96","C97","CC0","CC1","CC8","CC2","CC7","CC3","CC4","CC5","CC6","CA0","CA1","CA2","CA3","CA4","CA7","CA8","CAB","CAC","CB0","CB1","CB2","CB3","CB4","CB5","CD0","CD1","CD2","CD3","CD4","CD5","CD6","CD7","CD8","CE0","CE1","CE2","CE3","CE4","CE5","CE6","CE7","CG0","CG1","CG2","CG3","CG4","CG5","CH0","CH1","CH2","CH3","CH4"};
    public static final String[] FYCODE={"C00","C10"};


    ServiceClient sender;

    public WSService(){
        try{
            sender = new ServiceClient();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    public String invokeBaseInfoByTimeSpan(String fycode,String span){
        try {
            if(sender != null && StringUtils.isNotBlank(span)){
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
                String xml = "<Request><FYDM>"+new String(new String(Base64.encodeBase64(fycode.getBytes("UTF-8"))))+"</FYDM><JARQ>"+new String(new String(Base64.encodeBase64(span.getBytes("UTF-8"))))+"</JARQ><ZT>"+new String(new String(Base64.encodeBase64("1".getBytes("UTF-8"))))+"</ZT></Request>";
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
            calBegin.add(Calendar.DAY_OF_MONTH, 5);
            lDate.add(now+"-"+new SimpleDateFormat("yyyyMMdd").format(calBegin.getTime()));
            calBegin.add(Calendar.DAY_OF_MONTH, 1);
        }
        return lDate;
    }



    public int insertTask(WsTask task){
        return wsTaskMapper.insert(task);
    }

    public int updateTask(WsTask task){
        return wsTaskMapper.updateByPrimaryKey(task);
    }

    public int insertTaskItem(WsTaskItems item){
        return wsTaskItemsMapper.insert(item);
    }

    public int updateTaskItem(WsTaskItems item){
        return wsTaskItemsMapper.updateByPrimaryKey(item);
    }

    public int insertLog(WsLog item){
        return wsLogMapper.insert(item);
    }

    public int updateLog(WsLog item){
        return wsLogMapper.updateByPrimaryKey(item);
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
}
