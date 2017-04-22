package cn.gov.ahcourt.casecomment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/statics")
public class staticsController {

	@RequestMapping(value = "/checkreport", method = { RequestMethod.GET, RequestMethod.POST })
	public String checkreport() {
		return "statics/checkreport";
	}

	@RequestMapping(value = "/checktop", method = { RequestMethod.GET, RequestMethod.POST })
	public String checktop() {
		return "statics/checktop";
	}

	@RequestMapping(value = "/checkdata", method = { RequestMethod.GET, RequestMethod.POST })
	public String checkdata() {
		return "statics/checkdata";
	}

	@RequestMapping(value = "/chosenreport", method = { RequestMethod.GET, RequestMethod.POST })
	public String chosenreport() {
		return "statics/chosenreport";
	}

	@RequestMapping(value = "/chosentop", method = { RequestMethod.GET, RequestMethod.POST })
	public String chosentop() {
		return "statics/chosentop";
	}

	@RequestMapping(value = "/chosendata", method = { RequestMethod.GET, RequestMethod.POST })
	public String chosendata() {
		return "statics/chosendata";
	}

}
