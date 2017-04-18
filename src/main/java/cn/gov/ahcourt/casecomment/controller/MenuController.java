package cn.gov.ahcourt.casecomment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.MenuBean;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.service.MenuService;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/setting/menu")
public class MenuController {

	@Resource
	private MenuService menuService;


	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String menu_list() {
		return "setting/menu/list";
	}

	@RequestMapping(value = "/selectTreeList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<Map<String, Object>> getTreeList(MenuBean menu) {
		List<Map<String, Object>> list = menuService.selectTreeList(menu);
		return list;
	}

	@RequestMapping(value = "/getById", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody MenuBean getById(String cdid) {
		return menuService.getById(cdid);
	}

	@RequestMapping(value = "/deleteById", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int deleteById(String cdid) {
		return menuService.deleteById(cdid);
	}


	@RequestMapping(value = "/saveOrupdateMenu", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int saveOrupdateMenu(MenuBean menu, @SessionScope("user") UserBean user) {
		return menuService.saveOrupdateMenu(menu, user);
	}

	@RequestMapping(value = "move", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int move(@SessionScope("user") UserBean user, String[] ids, String targetid, String type) {
		if (ids == null || ids.length == 0) {
			return 0;
		}
		return menuService.move(user, ids, targetid, type);
	}

}
