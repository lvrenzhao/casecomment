package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.WsTask;
import cn.gov.ahcourt.casecomment.service.WSService;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
public class JobCaseInit {
    @Resource
    private WSService wsService;

    public void doInit(){
        try{
            //开启一个全量同步的Task
            WsTask wsTask = new WsTask();
            wsTask.setTasktype("A1");
            wsTask.setBegeindate(DateFormatUtils.ISO_DATETIME_FORMAT.format(new Date()));
            int flagWsTaskSaveState = wsService.saveTask(wsTask);
            int x = 30;
            do{
                System.out.print("value of x : " + x );
                x++;
                System.out.print("");
            }while( x < 20 );

            String xml = wsService.invokeBaseInfo();

            if(flagWsTaskSaveState == 1){
                //task已注册成功，开始执行task。

            }

            //###

            //###结束全量同步TASK
        }catch (Exception ex){

        }
    }
}
