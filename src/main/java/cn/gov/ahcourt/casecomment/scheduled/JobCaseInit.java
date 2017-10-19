package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.SettingBean;
import cn.gov.ahcourt.casecomment.bean.WsAj;
import cn.gov.ahcourt.casecomment.bean.WsAjid;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.apache.axiom.om.OMElement;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.namespace.QName;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
//该task建议每晚11点执行(如果没有匹配的全量设置项则不会执行，所以建议定时器每晚11点执行检查是否存在全量同步任务，有则执行)
@Service
public class JobCaseInit {
    @Resource
    private WSService wsService;

    @Resource
    private JobCaseConverter jobCaseConverter;

    @Resource
    private JobCaseFetcher jobCaseFetcher;

    public void doJob(){
        wsService.setTaskBegin();
        String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
        SettingBean setitem = wsService.getSetting("TASK_AJXX_QLTB");
        if(setitem != null && StringUtils.isNotBlank(setitem.getSetvalue())){
            String[] ss = setitem.getSetvalue().split("_");
            if(ss != null && ss.length>1 && today.equals(ss[1])){
                String[] tbfy = ss[0].split(",");
                System.out.println("@开始执行全量更新，共 "+tbfy.length +" 个法院。");
                int record = 0;
                for (int i = 0; i < tbfy.length; i++) {
                    wsService.deleteAjidByFjm(tbfy[i]);
                    int c_page = 1;
                    int t_page = 0;
                    do {
                        String xml = wsService.wsGetAllAJID(tbfy[i], today, c_page);
                        List<String> ajids = getAJIDS(xml);
                        for(int x = 0 ; ajids!=null && x<ajids.size();  x++){
                            WsAjid beanAjid = new WsAjid();
                            beanAjid.setTdhajid(ajids.get(x));
                            beanAjid.setFjm(tbfy[i]);
                            beanAjid.setCreatetime(new Date());
                            wsService.saveWsAjid(beanAjid);
                        }
                        if (c_page == 1) {
                            t_page = WSService.getT_PageNum(xml);
                        }
                        c_page++;
                    } while (c_page <= t_page);
                }
            }
        }
        //执行完毕，进行job转换
        jobCaseConverter.doJob();
        jobCaseFetcher.doJob();
    }

//    public void doJob(){
//        String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
//        int record = 0;
//        for (int i = 0; i < WSService.FYCODE.length; i++) {
//            int c_page = 1;
//            int t_page = 0;
//            do {
//                String xml = wsService.wsGetAllAJID(WSService.FYCODE[i], today, c_page);
//                List<String> ajids = getAJIDS(xml);
//                for(int x = 0 ; ajids!=null && x<ajids.size();  x++){
//                    System.out.println("process record ......"+ record);
//                    record ++;
//                    String baseinfoxml = wsService.wsGetOneBaseInfo(ajids.get(x));
//                    String fileinfoxml = "";
//                    String fycode = getFycode(baseinfoxml);
//                    String ah = getAH(baseinfoxml);
//                    if(StringUtils.isNotBlank(fycode)){
//                        fileinfoxml = wsService.wsGetOneFileInfo(wsService.getFbsxhByFyCode(fycode),ah,fycode);
//                    }
//                    //将webservice结果不处理直接存入数据库供后面解析
//                    WsCaseInfo caseInfo = new WsCaseInfo();
//                    caseInfo.setWsid(IdGen.uuid());
//                    caseInfo.setTdhid(ajids.get(x));
//                    caseInfo.setBaseinfoxml(baseinfoxml);
//                    caseInfo.setFileinfoxml(fileinfoxml);
//                    caseInfo.setRemark("1");
//                    wsService.insertCaseInfo(caseInfo);
//                }
//                if (c_page == 1) {
//                    t_page = WSService.getT_PageNum(xml);
//                }
//                c_page++;
//            } while (c_page <= t_page);
//        }
//    }



    private List<String> getAJIDS(String text){
        List<String> ajids = new ArrayList<String>();
        Pattern pattern = Pattern.compile("(?<=AHDM=\")\\S+(?=\")");
        Matcher matcher = pattern.matcher(text);
        while(matcher.find()) {
            ajids.add(new String(Base64.decodeBase64(matcher.group())));
        }
        return ajids;
    }

    private String getFycode(String text){
        Pattern pattern = Pattern.compile("(?<=<FYDM>)\\S+(?=</FYDM>)");
        Matcher matcher = pattern.matcher(text);
        if(matcher.find()) {
            String fjm = new String(Base64.decodeBase64(matcher.group()));
            int i = indexOfArr(WSService.FYCODE,fjm);
            if(i > -1){
                return WSService.FYDM[i];
            }
        }
        return "";
    }

    private String getAH(String text){
        Pattern pattern = Pattern.compile("(?<=<AH>)\\S+(?=</AH>)");
        Matcher matcher = pattern.matcher(text);
        if(matcher.find()) {
            return new String(Base64.decodeBase64(matcher.group()));
        }
        return "";
    }

    public static int indexOfArr(String[] arr,String value2){
        for(int i=0;i<arr.length;i++){
            if(arr[i].equals(value2)){
                return i;
            }
        }
        return -1;
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
