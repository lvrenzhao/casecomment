package cn.gov.ahcourt.casecomment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/casecheck")
public class CaseCheckExtractController {

	@RequestMapping(value = "/extract", method = { RequestMethod.GET, RequestMethod.POST })
	public String list() {
		return "casecheck/extract/list";
	}

}
