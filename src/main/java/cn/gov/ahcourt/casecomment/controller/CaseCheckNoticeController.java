package cn.gov.ahcourt.casecomment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/casecheck/notice")
public class CaseCheckNoticeController {

	@RequestMapping(value = "/verify", method = { RequestMethod.GET, RequestMethod.POST })
	public String verify() {
		return "casecheck/notice/verify";
	}
	@RequestMapping(value = "/verifyact", method = { RequestMethod.GET, RequestMethod.POST })
	public String verifyact() {
		return "casecheck/notice/verifyact";
	}
	@RequestMapping(value = "/handle", method = { RequestMethod.GET, RequestMethod.POST })
	public String handle() {
		return "casecheck/notice/handle";
	}
	@RequestMapping(value = "/upload", method = { RequestMethod.GET, RequestMethod.POST })
	public String upload() {
		return "casecheck/notice/upload";
	}
	@RequestMapping(value = "/history", method = { RequestMethod.GET, RequestMethod.POST })
	public String history() {
		return "casecheck/notice/history";
	}
	@RequestMapping(value = "/mylist", method = { RequestMethod.GET, RequestMethod.POST })
	public String mylist() {
		return "casecheck/notice/mylist";
	}
	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list() {
		return "casecheck/notice/list";
	}

}
