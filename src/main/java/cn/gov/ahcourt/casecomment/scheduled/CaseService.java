package cn.gov.ahcourt.casecomment.scheduled;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
public class CaseService {
    public static final String WEBSERVICE_BASE = "http://139.1.1.19:81/court/service/SzftWebService?wsdl";
    public static final String WEBSERVICE_FILE = "http://139.1.1.130:99/dagl/service/TDHYxxxService?wsdl";
    public static final String WEBSERVICE_VIDEO = "";



    //return 1 : SUCCESS  -1: FAILD
    public static int doBase(String xml){
        return -1;
    }

}
