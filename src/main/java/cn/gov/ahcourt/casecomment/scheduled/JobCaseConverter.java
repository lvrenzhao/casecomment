package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.WsAj;
import cn.gov.ahcourt.casecomment.bean.WsAjid;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
        if(StringUtils.isNotBlank(begintime)) {
            System.out.println("$开始执行案件数据转换.....");
            int pagesize = 1000;
            int t_page = wsService.getAllNeedConvertPage(begintime, pagesize);
            for (int i = 0; i < t_page; i++) {
                List<WsAjid> ls = wsService.getNeedConvertByPage(begintime, i * pagesize, pagesize);
                for (int l = 0; ls != null && l < ls.size(); l++) {
                    WsAjid item = ls.get(l);
                    WsAj beanAj = wsService.getWsAj(item.getFjm(), item.getTdhajid());
                    if (beanAj == null) {
                        beanAj = new WsAj();
                        beanAj.setTdhajid(item.getTdhajid());
                        beanAj.setFjm(item.getFjm());
                        beanAj.setFydm(getFyCodeByFjm(item.getFjm()));
                        beanAj.setCreatetime(new Date());
                    } else {
                        beanAj.setLastupdatetime(new Date());
                    }
                    String xmlbase = wsService.wsGetOneBaseInfo(item.getTdhajid());
                    beanAj.setXmlbase(xmlbase);
                    beanAj.setAh(getAH(xmlbase));
                    beanAj.setAjztmc(getAjztmc(xmlbase));
                    String xmlfile = wsService.wsGetOneFileInfo(wsService.getFbsxhByFyCode(beanAj.getFydm()), beanAj.getAh(), beanAj.getFydm());
                    beanAj.setXmlfile(xmlfile);
                    wsService.saveWsAj(beanAj);
                }
            }
        }
    }

    private String getFyCodeByFjm(String fjm){
        try {
            return WSService.FYDM[indexOfArr(WSService.FYCODE, fjm)];
        }catch (Exception ex){
            return "";
        }
    }
    public  int indexOfArr(String[] arr,String value2){
        for(int i=0;i<arr.length;i++){
            if(arr[i].equals(value2)){
                return i;
            }
        }
        return -1;
    }


    private String getAH(String text){
        Pattern pattern = Pattern.compile("(?<=<AH>)\\S+(?=</AH>)");
        Matcher matcher = pattern.matcher(text);
        if(matcher.find()) {
            return new String(Base64.decodeBase64(matcher.group()));
        }
        return "";
    }

    private String getAjztmc(String text){
        Pattern pattern = Pattern.compile("(?<=<AJZTMS>)\\S+(?=</AJZTMS>)");
        Matcher matcher = pattern.matcher(text);
        if(matcher.find()) {
            return new String(Base64.decodeBase64(matcher.group()));
        }
        return "";
    }

}
