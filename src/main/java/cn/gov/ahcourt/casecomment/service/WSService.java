package cn.gov.ahcourt.casecomment.service;

import cn.gov.ahcourt.casecomment.bean.BdMiddleCase;
import cn.gov.ahcourt.casecomment.bean.WsTask;
import cn.gov.ahcourt.casecomment.mapper.BdMiddleCaseMapper;
import cn.gov.ahcourt.casecomment.mapper.WsTaskMapper;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
@Service
public class WSService {

    @Resource
    private BdMiddleCaseMapper bdMiddleCaseMapper;

    @Resource
    private WsTaskMapper wsTaskMapper;

    public static final String WEBSERVICE_BASE = "http://139.1.1.19:81/court/service/SzftWebService?wsdl";
    public static final String WEBSERVICE_BASE_UN = "ahgyszft";
    public static final String WEBSERVICE_BASE_PW = "ahgyszftsa";
    public static final String WEBSERVICE_FILE = "http://139.1.1.130:99/dagl/service/TDHYxxxService?wsdl";
    public static final String WEBSERVICE_VIDEO = "";

    //return 1 : SUCCESS  -1: FAILD
    public void processBaseInfo(String xml){
        System.out.println(bdMiddleCaseMapper.selectAll(new BdMiddleCase()).size());
    }

    public String invokeBaseInfo(){
        try{

        }catch (Exception ex){

        }
        return "";
    }


    public int saveTask(WsTask task){
        if(task!=null && StringUtils.isNotBlank(task.getTaskid())){
            task.setTaskid(IdGen.uuid());
            return wsTaskMapper.insert(task);
        }else{
            return wsTaskMapper.updateByPrimaryKey(task);
        }
    }

}
