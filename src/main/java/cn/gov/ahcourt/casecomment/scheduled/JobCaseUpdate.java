package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.SettingBean;
import cn.gov.ahcourt.casecomment.bean.WsAjid;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lvrenzhao on 2017/10/9.
 */
//该task建议每天凌晨1点执行
@Service
public class JobCaseUpdate {
    @Resource
    private WSService wsService;

    @Resource
    private JobCaseConverter jobCaseConverter;

    @Resource
    private JobCaseFetcher jobCaseFetcher;

    public void doJob(){

        String zdsj = "";

        SettingBean setitemstartdate = wsService.getSetting("TASK_AJXX_ZLTB_STARTDATE");
        if(setitemstartdate != null && StringUtils.isNotBlank(setitemstartdate.getSetvalue())){
            zdsj = setitemstartdate.getSetvalue();
        }else{
            Calendar caltoday = Calendar.getInstance();
            caltoday.setTime(new Date());
            caltoday.add(Calendar.DAY_OF_MONTH, -1);
            zdsj = new SimpleDateFormat("yyyy-MM-dd").format(caltoday.getTime()) +" 00:00:00";
        }
        SettingBean setitem = wsService.getSetting("TASK_AJXX_ZLTB");
        if(setitem != null && StringUtils.isNotBlank(setitem.getSetvalue())){
            String[] tbfy = setitem.getSetvalue().split(",");
            wsService.setTaskBegin();
            System.out.println("#开始执行增量更新，共 "+tbfy.length +" 个法院。");
            for (int i = 0; i < tbfy.length; i++) {
                String xml = wsService.wsGetUpdateAJID(zdsj,tbfy[i]);
                List<String> ajids = getAJIDSForUpdate(xml);//todo
                for(int x = 0 ; ajids!=null && x<ajids.size();  x++){
                    WsAjid beanAjid = wsService.getWsAjid(ajids.get(x));
                    if(beanAjid == null){
                        beanAjid = new WsAjid();
                        beanAjid.setTdhajid(ajids.get(x));
                        beanAjid.setFjm(tbfy[i]);
                        beanAjid.setCreatetime(new Date());
                    }else{
                        beanAjid.setFjm(tbfy[i]);
                        beanAjid.setUpdatetime(new Date());
                    }
                    wsService.saveWsAjid(beanAjid);
                }
            }
        }
        jobCaseConverter.doJob();
        jobCaseFetcher.doJob();
    }

//    public void doJob(){
//        //获取昨天
//        Calendar caltoday = Calendar.getInstance();
//        caltoday.setTime(new Date());
//        caltoday.roll(Calendar.DAY_OF_MONTH, 1);
//        String zdsj = new SimpleDateFormat("yyyy-MM-dd").format(caltoday.getTime()) +" 00:00:00";
//        //调用
//        String xml = wsService.wsGetUpdateAJID(zdsj,"C10");
//        System.out.println(xml);
//        System.out.println(this.getClass().getName()+"......dojob");
//    }


    private List<String> getAJIDSForUpdate(String text){
        List<String> ajids = new ArrayList<String>();
        Pattern pattern = Pattern.compile("(?<=<AHDM>)\\S{1,40}(?=</AHDM>)");
        Matcher matcher = pattern.matcher(text);
        while(matcher.find()) {
            ajids.add(new String(Base64.decodeBase64(matcher.group())));
        }
        return ajids;
    }
}
