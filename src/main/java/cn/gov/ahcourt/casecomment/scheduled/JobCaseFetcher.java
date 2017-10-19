package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.bean.WsAj;
import cn.gov.ahcourt.casecomment.bean.WsAjid;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lvrenzhao on 2017/10/19.
 */
@Service
public class JobCaseFetcher {
    @Resource
    private WSService wsService;

    public void doJob(){
        String begintime = wsService.getTaskBeginTime();
        if(StringUtils.isNotBlank(begintime)) {
            System.out.println("$开始提取有效案件（归档案件）.....");
            for(int f = 0 ; f <WSService.FYCODE.length ; f ++){
                String fjm = WSService.FYCODE[f];
                int pagesize = 1000;
                int t_page = wsService.getAllNeedFetchPage(fjm,begintime, pagesize);
                for (int i = 0; i < t_page; i++) {
                    List<WsAj> ls = wsService.getNeedFetchByPage(fjm,begintime, i * pagesize, pagesize);
                    for (int l = 0; ls != null && l < ls.size(); l++) {
                        WsAj item = ls.get(l);
                        System.out.println(item.getAh());
                    }
                }
            }

        }

    }

}
