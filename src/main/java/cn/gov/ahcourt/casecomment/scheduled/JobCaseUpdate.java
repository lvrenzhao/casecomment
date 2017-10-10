package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.mapper.BdMiddleCaseMapper;
import cn.gov.ahcourt.casecomment.service.WSService;

import javax.annotation.Resource;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
public class JobCaseUpdate {
    @Resource
    private WSService wsService;

    public void doUpdate(){
        wsService.processBaseInfo("123");
    }
}
