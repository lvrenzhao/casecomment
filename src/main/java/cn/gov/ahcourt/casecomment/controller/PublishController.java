package cn.gov.ahcourt.casecomment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/publish")
public class PublishController {

	@RequestMapping(value = "/input", method = { RequestMethod.GET, RequestMethod.POST })
	public String input() {
		return "publish/input";
	}

	@RequestMapping(value = "/verify", method = { RequestMethod.GET, RequestMethod.POST })
	public String verify() {
		return "publish/verify";
	}
	@RequestMapping(value = "/unwatch", method = { RequestMethod.GET, RequestMethod.POST })
	public String unwatch() {
		return "publish/unwatch";
	}
	@RequestMapping(value = "/watched", method = { RequestMethod.GET, RequestMethod.POST })
	public String watched() {
		return "publish/watched";
	}

	@RequestMapping(value = "/mylist", method = { RequestMethod.GET, RequestMethod.POST })
	public String mylist() {
		return "publish/mylist";
	}

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list() {
		return "publish/list";
	}

}
