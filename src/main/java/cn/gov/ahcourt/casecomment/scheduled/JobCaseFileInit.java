package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by lvrenzhao on 2017/10/12.
 */
@Service
public class JobCaseFileInit {
    @Resource
    private WSService wsService;

    public void doJob(){
        try{
            //了解档案的分布式规则。
            String ah = "(2017)皖刑终4号";
            String fycode= "340000";
            String xml = wsService.invokeFileInfoByAh(getFbsxhByFyCode(fycode),ah,fycode);
            System.out.println(xml);
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    private int getFbsxhByFyCode(String fycode){
        return 0;
    }
}
