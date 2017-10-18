package cn.gov.ahcourt.casecomment.scheduled;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by lvrenzhao on 2017/10/18.
 */
@Service
public class JobCaseConverter {
    @Resource
    private WSService wsService;
    //先取出ws_aj_xx的最后更新时间
    public void doJob(){
        String begintime = wsService.getTaskBeginTime();
        System.out.println("$开始执行案件数据转换.....");
        //
    }
}
