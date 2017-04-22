package cn.gov.ahcourt.casecomment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/setting/log")
public class LogController {

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list() {
		return "/setting/log/list";
	}

}
