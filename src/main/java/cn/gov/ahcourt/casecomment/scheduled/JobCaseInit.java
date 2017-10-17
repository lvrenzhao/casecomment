package cn.gov.ahcourt.casecomment.scheduled;

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
import java.util.regex.Pattern;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
@Service
public class JobCaseInit {
    @Resource
    private WSService wsService;

    public void doJob(){
        String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
        for (int i = 0; i < WSService.FYCODE.length; i++) {
            int c_page = 1;
            int t_page = 0;
            do {
                String xml = wsService.wsGetAllAJID(WSService.FYCODE[i], today, c_page);
                if (c_page == 1) {
                    t_page = WSService.getT_PageNum(xml);
                }
                c_page++;
            } while (c_page <= t_page);
        }
    }























    //============================老方法==================================
//    public void doJob(){
//        //请求获取案件标识号
//        WsTask wsTask = new WsTask();
//        String taskid = IdGen.uuid();
//        wsTask.setTaskid(taskid);
//        wsTask.setTasktype("A1");
//        wsTask.setBegeindate(DateFormatUtils.ISO_DATETIME_FORMAT.format(new Date()));
//        int flagWsTaskSaveState = wsService.insertTask(wsTask);
//        if(flagWsTaskSaveState == 1){
//            int c_page = 0;
//            int t_page = 0;
//            do{
//                WsTaskItems currentTaskItem = new WsTaskItems();
//                String taskitemid = IdGen.uuid();
//                currentTaskItem.setTaskitemid(taskitemid);
//                currentTaskItem.setTaskid(taskid);
//                currentTaskItem.setParams("");//todo
//                currentTaskItem.setExetime(DateFormatUtils.ISO_DATETIME_FORMAT.format(new Date()));
//                wsService.insertTaskItem(currentTaskItem);
//                try{
//                    String result = wsService.invokeBaseInfoOnlyTdhAjid(c_page);
//                    if(result != null && StringUtils.isNotBlank(result)){
////                        currentTaskItem.setDatacount(0);//todo
//                        currentTaskItem.setResults(result);
//                        wsService.updateTaskItem(currentTaskItem);
//                    }
//                }catch (Exception ex){
//                    WsLog log = new WsLog();
//                    log.setErrorid(IdGen.uuid());
//                    log.setTaskid(taskid);
//                    log.setTaskitemid(taskitemid);
//                    log.setLog(ex.getMessage());
//                    wsService.insertLog(log);
//                }
//                if(c_page == 0){
//                    t_page = 0;
//                }
//                c_page++;
//            }while( c_page < t_page );
//        }
//    }

//    public void doJob(){
//        //开启一个全量同步的Task
//        WsTask wsTask = new WsTask();
//        String taskid = IdGen.uuid();
//        wsTask.setTaskid(taskid);
//        wsTask.setTasktype("A1");
//        wsTask.setBegeindate(DateFormatUtils.ISO_DATETIME_FORMAT.format(new Date()));
//        int flagWsTaskSaveState = wsService.insertTask(wsTask);
//        if(flagWsTaskSaveState == 1){
//            //=============task已注册成功，开始执行task。
//            List<String> dateblock = WSService.findDates("20160101","20161231");
////            List<String> dateblock = WSService.findDates("20160101",new SimpleDateFormat("yyyyMMdd").format(new Date()));
//            for(int i = 0 ; i < dateblock.size() ; i ++){
//                for(int j = 0 ; j < WSService.FYCODE.length; j++){
//                    String currentDay = dateblock.get(i);
//                    String currentFyCode = WSService.FYCODE[j];
//                    WsTaskItems currentTaskItem = new WsTaskItems();
//                    String taskitemid = IdGen.uuid();
//                    currentTaskItem.setTaskitemid(taskitemid);
//                    currentTaskItem.setTaskid(taskid);
//                    currentTaskItem.setParams(currentDay+"_"+currentFyCode);
//                    currentTaskItem.setExetime(DateFormatUtils.ISO_DATETIME_FORMAT.format(new Date()));
//                    wsService.insertTaskItem(currentTaskItem);
//                    try{
//                        String result = wsService.invokeBaseInfoByTimeSpan(currentFyCode,currentDay);
//                        if(result != null && StringUtils.isNotBlank(result)){
//                            //直接取webservice数据,不进行任何加工直接存入数据库（包含异常信息）。记录count 供后面分析是否存在count>1000的数据
//                            currentTaskItem.setDatacount(WSService.getAllCount(result));
//                            currentTaskItem.setResults(result);
//                            wsService.updateTaskItem(currentTaskItem);
//                        }
//                    }catch (Exception ex){
//                        WsLog log = new WsLog();
//                        log.setErrorid(IdGen.uuid());
//                        log.setTaskid(taskid);
//                        log.setTaskitemid(taskitemid);
//                        log.setLog(ex.getMessage());
//                        wsService.insertLog(log);
//                    }
//                }
//            }
//        }
//        //结束全量同步TASK
//        wsTask.setEnddate(DateFormatUtils.ISO_DATETIME_FORMAT.format(new Date()));
//        wsService.updateTask(wsTask);
//    }
}
