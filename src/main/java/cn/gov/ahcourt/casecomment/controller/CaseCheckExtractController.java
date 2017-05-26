package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/casecheck")
public class CaseCheckExtractController {

	@RequestMapping(value = "/extract", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(ModelMap modelMap,@SessionScope("user")UserBean user) {
		modelMap.addAttribute("zzid",user.getZzid());
		return "casecheck/extract/list";
	}

}
