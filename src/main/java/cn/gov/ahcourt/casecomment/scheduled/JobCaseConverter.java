package cn.gov.ahcourt.casecomment.scheduled;

import org.springframework.stereotype.Service;

/**
 * Created by lvrenzhao on 2017/10/18.
 */
@Service
public class JobCaseConverter {
    public void doJob(){
        System.out.println("$开始执行案件数据转换.....");
    }
}
