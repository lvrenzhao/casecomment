package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.BdMiddleCase;
import cn.gov.ahcourt.casecomment.bean.WsTask;
import cn.gov.ahcourt.casecomment.mapper.BdMiddleCaseMapper;
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

/**
 * Created by lvrenzhao on 2017/10/9.
 */
@Service
public class WSService {

    @Resource
    private BdMiddleCaseMapper bdMiddleCaseMapper;

    @Resource
    private WsTaskMapper wsTaskMapper;

    public static final String WEBSERVICE_BASE = "http://139.1.1.19:81/court/service/SzftWebService";
    public static final String WEBSERVICE_BASE_NS = "http://szft.tdh/";
    public static final String WEBSERVICE_BASE_UN = "dic";
    public static final String WEBSERVICE_BASE_PW = "dic";
    private static final String WEBSERVICE_BASE_STARTDATE = "2016-01-01";
    private static final String WEBSERVICE_BASE_ENDDATE = "2017-12-31";
    public static final String WEBSERVICE_FILE = "http://139.1.1.130:99/dagl/service/TDHYxxxService?wsdl";
    public static final String WEBSERVICE_VIDEO = "";
    ServiceClient sender;

    public WSService(){
        try{
            sender = new ServiceClient();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    //return 1 : SUCCESS  -1: FAILD
    public void processBaseInfo(String xml){
        System.out.println(bdMiddleCaseMapper.selectAll(new BdMiddleCase()).size());
    }

    public String invokeBaseInfo(){
        try {
            if(sender != null){
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
                String xml = "<Request><AH>"+new String(new String(Base64.encodeBase64("(2017)皖刑终4号".getBytes("UTF-8"))))+"</AH><ZT>"+new String(new String(Base64.encodeBase64("1".getBytes("UTF-8"))))+"</ZT></Request>";
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
                OMElement elementReturn = result.getFirstElement();
                System.out.println(new String(Base64.decodeBase64(elementReturn.getText())));
                System.out.println(result.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }


    public int saveTask(WsTask task){
        if(task!=null && StringUtils.isNotBlank(task.getTaskid())){
            return wsTaskMapper.updateByPrimaryKey(task);
        }else{
            task.setTaskid(IdGen.uuid());
            return wsTaskMapper.insert(task);
        }
    }

}
