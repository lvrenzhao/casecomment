package cn.gov.ahcourt.casecomment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.RoleBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gov.ahcourt.casecomment.utils.SessionScope;
//import cn.gov.ahcourt.casecomment.bean.SettingBean;
import cn.gov.ahcourt.casecomment.bean.UserBean;
//import cn.gov.ahcourt.casecomment.enums.SettingKeys;
//import cn.gov.ahcourt.casecomment.service.OAStaffService;
import cn.gov.ahcourt.casecomment.service.MenuService;
import cn.gov.ahcourt.casecomment.service.RoleService;
//import cn.gov.ahcourt.casecomment.service.setting.SettingService;
import cn.gov.ahcourt.casecomment.service.UserService;

@Controller
@RequestMapping("/setting/user")
public class UserController {
	@Resource
	private UserService userService;

	@Resource
	private RoleService reloService;

	@Resource
	private MenuService menuService;

	
	
	@RequestMapping("/list")
	public String userlist() {
		return "setting/user/list";
	}

	@RequestMapping("/getlist")
	public @ResponseBody Map getlist(UserBean bean) {
		if (bean.getZzid() != null && bean.getZzid() != "") {
			bean.setZzids(bean.getZzid().split(";"));
		}
		return userService.getlist(bean);
	}

	@RequestMapping("/update")
	public @ResponseBody int update(UserBean bean) {
		return userService.update(bean);
	}

	@RequestMapping("/input")
	public String account_input(String id, String mode, Model model) {


		model.addAttribute("mode", mode);
		if(mode !=null && mode !="" && mode.equals("ktzh")){
			//code deleted..
		}else{
			UserBean bean = userService.getById(id);
			model.addAttribute("bean", bean);
		}

		List<RoleBean> roleList = reloService.selectList(null);
		model.addAttribute("roleList", roleList);

		return "/setting/user/input";
	}
//
//	@RequestMapping("/getById")
//	public @ResponseBody OAStaffBean getById(OAStaffBean bean) {
//		if (bean.getYgid() != null && bean.getYgid() != "") {
//			return oAStaffService.selectbyid(bean);
//		} else {
//			return null;
//		}
//
//	}

	@RequestMapping("/saveOrUpdate")
	public @ResponseBody int saveOrUpdate(UserBean bean, @SessionScope("user")UserBean user) {
		return userService.saveOrUpdate(bean, user);
	}


	/**
	 * 跳转到我的客户
	 * 
	 * @return
	 */
	@RequestMapping("/myaccount")
	public String myaccount(Model model, @SessionScope("user") UserBean user) {

		UserBean bean = userService.getUser(user.getYhid());
		model.addAttribute("user", bean);

		return "/setting/myaccount/myaccount";
	}

	@RequestMapping("/updatemm")
	public @ResponseBody int updatemm(UserBean user, @SessionScope("user") UserBean userBean) {
		return userService.updatemm(user,userBean);
	}
	
	@RequestMapping("/zhgllist")
	public @ResponseBody Map zhgllist(UserBean bean) {
		if (bean.getZzid() != null && bean.getZzid() != "") {
			bean.setZzids(bean.getZzid().split(";"));
		}
		return userService.zhgllist(bean);
	}
	@RequestMapping("/checkzh")
	public @ResponseBody List<UserBean> checkzh(UserBean bean) {
		return userService.selectList(bean);
	}
	
}
