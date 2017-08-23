package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.BdMiddleCase;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.BdMiddleCaseMapper;
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
@RequestMapping("/case")
public class XCaseController {

    @Resource
	private BdMiddleCaseMapper bdMiddleCaseMapper;

    @RequestMapping("/list")
    public @ResponseBody Map list(BdMiddleCase bean, @SessionScope("user") UserBean user) {
        if (user == null) {
            return null;
        }
        return bean.toMap(bdMiddleCaseMapper.selectAll());
    }

}
