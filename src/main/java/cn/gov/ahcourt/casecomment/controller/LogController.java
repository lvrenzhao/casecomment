package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.SdLogs;
import cn.gov.ahcourt.casecomment.mapper.SdLogsMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

@Controller
@RequestMapping("/setting/log")
public class LogController {


	@Resource
	private SdLogsMapper  sdLogsMapper;

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list() {
		return "/setting/log/list";
	}

	@RequestMapping("/listjson")
	public @ResponseBody
	Map listjson(SdLogs bean) {
		return bean.toMap(sdLogsMapper.select(bean));
	}

}
