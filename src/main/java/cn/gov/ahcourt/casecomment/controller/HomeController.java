package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.DictBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {



	@RequestMapping(value = "/home", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(DictBean entity) {
		return "../home";
	}


}
