package cn.gov.ahcourt.casecomment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gov.ahcourt.casecomment.bean.DictBean;
import cn.gov.ahcourt.casecomment.service.DictService;
import cn.gov.ahcourt.casecomment.utils.StringUtils;

@Controller
@RequestMapping("/setting/dict")
public class DictController {

	@Resource
	private DictService dictService;

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(DictBean entity) {
		return "setting/dictionary/list";
	}

	@RequestMapping(value = "/getGroupList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Map<String, Object> getGroupList(DictBean entity) {
		entity.setSjzdbh("0");
		return entity.toMap(dictService.selectList(entity));
	}

	@RequestMapping(value = "/getList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Map<String, Object> getlist(DictBean entity) {
		return entity.toMap(dictService.selectList(entity));
	}

	@RequestMapping(value = "/getByParent", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<DictBean> getByParent(String parent_id) {
		return dictService.selectListByParents(parent_id);
	}

	@RequestMapping(value = "/getByGroup", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<DictBean> getByGroup(String group_id) {
		return dictService.selectListByGroup(group_id);
	}

	@RequestMapping(value = "/editDict", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int update(DictBean entity) {
		return dictService.updateByIdSelective(entity);
	}

	@RequestMapping(value = "/delDict", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int delete(String zdbh) {
		if (StringUtils.isBlank(zdbh)) {
			return 0;
		}
		return dictService.deleteSelective(zdbh);
	}

	@RequestMapping(value = "/addDict", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int insert(DictBean entity) {
		return dictService.insertSelective(entity);
	}

	@RequestMapping(value = "/check", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<DictBean> check(DictBean entity) {
		return dictService.selectList(entity);
	}

	@RequestMapping(value = "/test", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody DictBean test(String sjzdbh, String zdmc) {
		return dictService.selectOrInsertByName(sjzdbh, zdmc);
	}
}
