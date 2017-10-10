package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.BdCheck;
import cn.gov.ahcourt.casecomment.bean.BdCheckCases;
import cn.gov.ahcourt.casecomment.bean.BdChosen;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.BdCheckCasesMapper;
import cn.gov.ahcourt.casecomment.mapper.BdCheckMapper;
import cn.gov.ahcourt.casecomment.mapper.BdChosenMapper;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Created by lvrenzhao on 2017/8/24.
 */

@Controller
@RequestMapping("/static")
public class XStaticsController {

    @Resource
    private BdCheckMapper bdCheckMapper;

    @Resource
    private BdCheckCasesMapper bdCheckCasesMapper;

    @Resource
    private BdChosenMapper bdChosenMapper;

    @RequestMapping("/checkreport")
    public @ResponseBody Map checkreport(BdCheck bean, @SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setFlag("1");
        return bean.toMap(bdCheckMapper.selectAll(bean));
    }

    @RequestMapping("/chosenreport")
    public @ResponseBody Map chosenreport(BdChosen bean, @SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setFlag("1");
        return bean.toMap(bdChosenMapper.selectAll(bean));
    }

    @RequestMapping("/topcheck")
    public @ResponseBody Map topcheck(BdCheckCases bean){
        return bean.toMap(bdCheckCasesMapper.selectTop(bean));
    }

}
