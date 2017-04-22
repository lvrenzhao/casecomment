package cn.gov.ahcourt.casecomment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/casechosen/config")
public class CaseChosenConfigController {

	@RequestMapping(value = "/score", method = { RequestMethod.GET, RequestMethod.POST })
	public String score() {
		return "casechosen/config/score";
	}

}
