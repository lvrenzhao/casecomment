package cn.gov.ahcourt.casecomment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/casecheck/check")
public class CaseCheckController {

	@RequestMapping(value = "/todo", method = { RequestMethod.GET, RequestMethod.POST })
	public String todo() {
		return "casecheck/check/todo";
	}

	@RequestMapping(value = "/check", method = { RequestMethod.GET, RequestMethod.POST })
	public String check(ModelMap model, String mode ) {
		model.addAttribute("mode", mode);
		return "casecheck/check/check";
	}
	@RequestMapping(value = "/history", method = { RequestMethod.GET, RequestMethod.POST })
	public String history() {
		return "casecheck/check/history";
	}

	@RequestMapping(value = "/mylist", method = { RequestMethod.GET, RequestMethod.POST })
	public String mylist() {
		return "casecheck/check/mylist";
	}

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list() {
		return "casecheck/check/list";
	}

}
