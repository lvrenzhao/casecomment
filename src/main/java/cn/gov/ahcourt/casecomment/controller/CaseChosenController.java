package cn.gov.ahcourt.casecomment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/casechosen/chosen")
public class CaseChosenController {

	@RequestMapping(value = "/todo", method = { RequestMethod.GET, RequestMethod.POST })
	public String todo() {
		return "/casechosen/chosen/todo";
	}


	@RequestMapping(value = "/chosen", method = { RequestMethod.GET, RequestMethod.POST })
	public String chosen(ModelMap model, String mode ) {
		model.addAttribute("mode", mode);
		return "casechosen/chosen/chosen";
	}
	@RequestMapping(value = "/choseninfo", method = { RequestMethod.GET, RequestMethod.POST })
	public String choseninfo(ModelMap model, String mode ) {
		model.addAttribute("mode", mode);
		return "casechosen/chosen/choseninfo";
	}

	@RequestMapping(value = "/history", method = { RequestMethod.GET, RequestMethod.POST })
	public String history() {
		return "/casechosen/chosen/history";
	}

	@RequestMapping(value = "/mylist", method = { RequestMethod.GET, RequestMethod.POST })
	public String mylist() {
		return "/casechosen/chosen/mylist";
	}

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list() {
		return "/casechosen/chosen/list";
	}
}
