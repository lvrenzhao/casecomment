package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.WsLog;
import cn.gov.ahcourt.casecomment.bean.WsTask;
import cn.gov.ahcourt.casecomment.bean.WsTaskItems;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.apache.axiom.om.OMElement;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.namespace.QName;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
@Service
public class JobCaseInit {
    @Resource
    private WSService wsService;

    public void doInit(){
//        String currentDay;
//        String currentFyCode;
//        String currentResult;
//        WsTaskItems currentTaskItem ;
//        List<String> dateblock = WSService.findDates("20160101",new SimpleDateFormat("yyyyMMdd").format(new Date()));
        List<String> dateblock = WSService.findDates("20160101","20160131");

        //开启一个全量同步的Task
        WsTask wsTask = new WsTask();
        String taskid = IdGen.uuid();
        wsTask.setTaskid(taskid);
        wsTask.setTasktype("A1");
        wsTask.setBegeindate(DateFormatUtils.ISO_DATETIME_FORMAT.format(new Date()));
        int flagWsTaskSaveState = wsService.insertTask(wsTask);
        if(flagWsTaskSaveState == 1){
//            String result = wsService.invokeBaseInfoByOneDay("C10","20160101-20160111");
//            System.out.println(result);
            //=============task已注册成功，开始执行task。
            for(int i = 0 ; i < dateblock.size() ; i ++){
                for(int j = 0 ; j < WSService.FYCODE.length; j++){
                    String currentDay = dateblock.get(i);
                    String currentFyCode = WSService.FYCODE[j];
                    WsTaskItems currentTaskItem = new WsTaskItems();
                    String taskitemid = IdGen.uuid();
                    currentTaskItem.setTaskitemid(taskitemid);
                    currentTaskItem.setTaskid(taskid);
                    currentTaskItem.setParams(currentDay+"_"+currentFyCode);
                    wsService.insertTaskItem(currentTaskItem);
                    try{
                        OMElement currentResult = wsService.invokeBaseInfoByOneDay(currentFyCode,currentDay);
                        if(currentResult != null && StringUtils.isNotBlank(currentResult.getText())){
                            String x = ((OMElement)currentResult.getChildElements().next()).getAttribute(new QName("Count")).getAttributeValue();
//                            currentTaskItem.setDatacount();
                            currentTaskItem.setResults(new String(Base64.decodeBase64(currentResult.getText())));
                            wsService.updateTaskItem(currentTaskItem);
                        }
                    }catch (Exception ex){
                        WsLog log = new WsLog();
                        log.setErrorid(IdGen.uuid());
                        log.setTaskid(taskid);
                        log.setTaskitemid(taskitemid);
                        log.setLog(ex.getMessage());
                    }
                }
            }
//                //先取webservice数据,不进行任何加工直接存入数据库（包含异常信息）。记录count 已分析是否有天数>1000
        }
        //###结束全量同步TASK

    }
}
