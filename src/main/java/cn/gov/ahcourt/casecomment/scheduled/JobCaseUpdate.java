package cn.gov.ahcourt.casecomment.scheduled;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
@Service
public class JobCaseUpdate {
    @Resource
    private WSService wsService;

    public void doUpdate(){
        wsService.processBaseInfo("123");
    }
}
