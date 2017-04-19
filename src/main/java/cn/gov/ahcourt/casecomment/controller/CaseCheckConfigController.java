package cn.gov.ahcourt.casecomment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/casecheck/config")
public class CaseCheckConfigController {

	@RequestMapping(value = "/level", method = { RequestMethod.GET, RequestMethod.POST })
	public String level() {
		return "casecheck/config/level";
	}

	@RequestMapping(value = "/score", method = { RequestMethod.GET, RequestMethod.POST })
	public String score() {
		return "casecheck/config/score";
	}

}
