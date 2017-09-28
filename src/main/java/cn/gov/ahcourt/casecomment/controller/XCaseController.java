package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.BdMiddleCase;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.BdMiddleCaseMapper;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
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
        //处理bean对象，转化为mabtis接受的querybean
        if(bean != null && StringUtils.isNotBlank(bean.getJoinedCaseIds())){
            bean.setJcs(bean.getJoinedCaseIds().split(";"));
        }
        if(bean != null && StringUtils.isNotBlank(bean.getFormAjxzUnSplited())){
            bean.setFormAjxz(bean.getFormAjxzUnSplited().split(";"));
        }
        if(bean != null && StringUtils.isNotBlank(bean.getFormAjlxUnSplited())){
            bean.setFormAjlx(bean.getFormAjlxUnSplited().split(";"));
        }
        if(bean != null && StringUtils.isNotBlank(bean.getFormGsfyUnlplited())){
            bean.setFormGsfy(bean.getFormGsfyUnlplited().split(";"));
        }
        return bean.toMap(bdMiddleCaseMapper.selectAll(bean));
    }

    @RequestMapping("/random")
    public @ResponseBody Map random(BdMiddleCase bean, @SessionScope("user") UserBean user) {
        if (user == null) {
            return null;
        }
        //处理bean对象，转化为mabtis接受的querybean
        if(bean != null && StringUtils.isNotBlank(bean.getJoinedCaseIds())){
            bean.setJcs(bean.getJoinedCaseIds().split(";"));
        }
        return bean.toMap(bdMiddleCaseMapper.random(bean));
    }



}
