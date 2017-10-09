package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.BdCheck;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.BdCheckMapper;
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

    @RequestMapping("/checkreport")
    public @ResponseBody
    Map report(BdCheck bean, @SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setFlag("1");
        return bean.toMap(bdCheckMapper.selectAll(bean));
    }
}
