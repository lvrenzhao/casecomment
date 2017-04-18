package cn.gov.ahcourt.casecomment.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gov.ahcourt.casecomment.bean.RoleBean;
import cn.gov.ahcourt.casecomment.service.RoleMenuService;
import cn.gov.ahcourt.casecomment.service.RoleService;

@Controller
@RequestMapping("/setting/role")
public class RoleController {

	@Resource
	private RoleService roleService;

	@Resource
	private RoleMenuService roleMenuService;

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String menu_list() {
		return "/setting/role/list";
	}

	@RequestMapping(value = "/roleList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<RoleBean> selectMenuBtn(RoleBean bean) {
		return roleService.selectList(bean);
	}

	@RequestMapping(value = "/deleteRole", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int deleteRole(String id) {
		return roleService.deleteById(id);
	}

	@RequestMapping(value = "/saveRole", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int saveRole(RoleBean bean) {
		return roleService.insertSelective(bean);
	}

	@RequestMapping(value = "/saveRoleMenu", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int saveRoleMenu(String jsid, String cdids, HttpSession httpSession) {
		return roleMenuService.insertSelective(jsid, cdids, httpSession);
	}

}
