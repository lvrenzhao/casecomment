package cn.gov.ahcourt.casecomment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/casechosen/notice")
public class CaseChosenNoticeController {



	@RequestMapping(value = "/input", method = { RequestMethod.GET, RequestMethod.POST })
	public String input() {
		return "casechosen/notice/input";
	}

	@RequestMapping(value = "/mylist", method = { RequestMethod.GET, RequestMethod.POST })
	public String mylist() {
		return "casechosen/notice/mylist";
	}

	@RequestMapping(value = "/caselist", method = { RequestMethod.GET, RequestMethod.POST })
	public String caselist(ModelMap model, String mode , String ggid) {
		model.addAttribute("mode", mode);
		return "casechosen/notice/case_list";
	}

	@RequestMapping(value = "/verify", method = { RequestMethod.GET, RequestMethod.POST })
	public String verify() {
		return "casechosen/notice/verify";
	}

	@RequestMapping(value = "/handle", method = { RequestMethod.GET, RequestMethod.POST })
	public String handle() {
		return "casechosen/notice/handle";
	}
	
	@RequestMapping(value = "/history", method = { RequestMethod.GET, RequestMethod.POST })
	public String history() {
		return "casechosen/notice/history";
	}

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list() {
		return "casechosen/notice/list";
	}

}
