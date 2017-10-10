package cn.gov.ahcourt.casecomment.service;

import cn.gov.ahcourt.casecomment.bean.BdMiddleCase;
import cn.gov.ahcourt.casecomment.mapper.BdMiddleCaseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
@Service
public class WSService {

    @Resource
    private BdMiddleCaseMapper bdMiddleCaseMapper;

    public static final String WEBSERVICE_BASE = "http://139.1.1.19:81/court/service/SzftWebService?wsdl";
    public static final String WEBSERVICE_BASE_UN = "";
    public static final String WEBSERVICE_BASE_PW = "";
    public static final String WEBSERVICE_FILE = "http://139.1.1.130:99/dagl/service/TDHYxxxService?wsdl";
    public static final String WEBSERVICE_VIDEO = "";

    //return 1 : SUCCESS  -1: FAILD
    public void processBaseInfo(String xml){
        System.out.println(bdMiddleCaseMapper.selectAll(new BdMiddleCase()).size());
    }

}
