package cn.gov.ahcourt.casecomment.scheduled;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
@Service
public class JobCaseUpdate {
    @Resource
    private WSService wsService;

    public void doJob(){
        //获取昨天
        Calendar caltoday = Calendar.getInstance();
        caltoday.setTime(new Date());
        caltoday.roll(Calendar.DAY_OF_MONTH, 1);
        String zdsj = new SimpleDateFormat("yyyy-MM-dd").format(caltoday.getTime()) +" 00:00:00";
        //调用
        String xml = wsService.wsGetUpdateAJIDByDay(zdsj,"C10");
        System.out.println(xml);
        System.out.println(this.getClass().getName()+"......dojob");
    }
}
