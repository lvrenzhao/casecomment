package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.WsTask;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
@Service
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
            if(flagWsTaskSaveState == 1){
                //task已注册成功，开始执行task。
                int page = 0;
                int allpage = 0;
                do{
                    String xml = wsService.invokeBaseInfo();
                    page++;
                }while( page < allpage );

            }

            //###

            //###结束全量同步TASK
        }catch (Exception ex){

        }
    }
}
