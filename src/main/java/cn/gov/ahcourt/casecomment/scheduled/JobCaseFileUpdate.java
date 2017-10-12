package cn.gov.ahcourt.casecomment.scheduled;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by lvrenzhao on 2017/10/12.
 */
@Service
public class JobCaseFileUpdate {
    @Resource
    private WSService wsService;

    public void doJob(){
        System.out.println(this.getClass().getName()+"......dojob");
    }
}
