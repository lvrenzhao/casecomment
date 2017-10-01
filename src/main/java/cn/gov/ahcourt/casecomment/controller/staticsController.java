package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/statics")
public class staticsController {

//	@Resource
//	private BdCasecheckNoticeMapper bdCasecheckNoticeMapper;

	@RequestMapping(value = "/checkreport", method = { RequestMethod.GET, RequestMethod.POST })
	public String checkreport() {
		return "statics/checkreport";
	}

	@RequestMapping(value = "/checkreportitem", method = { RequestMethod.GET, RequestMethod.POST })
	public String checkreportitem() {
		return "statics/checkreport_item";
	}

	@RequestMapping("/checkreportlist1json")
	public @ResponseBody
	Map checkreportlist1json(@SessionScope("user") UserBean user) {
		if (user == null) {
			return null;
		}
//        return bean.toMap(bdPublishMapper.selectMyList(bean));
		return null;
	}
	@RequestMapping("/checkreportlist2json")
	public @ResponseBody Map checkreportlist2json(@SessionScope("user") UserBean user) {
		if (user == null) {
			return null;
		}
//        return bean.toMap(bdPublishMapper.selectMyList(bean));
		return null;
	}
	@RequestMapping("/checkreportlist3json")
	public @ResponseBody Map checkreportlist3json(@SessionScope("user") UserBean user) {
		if (user == null) {
			return null;
		}
//        return bean.toMap(bdPublishMapper.selectMyList(bean));
		return null;
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
		return "statics/bak_chosendata";
	}

	@RequestMapping(value = "/chosenreportitem", method = { RequestMethod.GET, RequestMethod.POST })
	public String chosenreportitem() {
		return "statics/chosenreport_item";
	}

}
