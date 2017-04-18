package cn.gov.ahcourt.casecomment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gov.ahcourt.casecomment.bean.OrganizationBean;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.service.OrganizationService;
import cn.gov.ahcourt.casecomment.service.UserService;
import cn.gov.ahcourt.casecomment.utils.IdGen;

@Controller
@RequestMapping("/setting/organization")
public class OrganizationController {
	private static String PATH="/setting/organization/";
	
	@Resource
	private OrganizationService organizationService;
	
	@Resource
	private UserService userService;
	@RequestMapping("list")
	public String list(){
		return PATH+"organization_list";
	}

	@RequestMapping("/getlist")
	public @ResponseBody List<OrganizationBean> getlist(OrganizationBean bean) {
		return organizationService.getlist(bean);
	}
	
	@RequestMapping("/addorg")
	public @ResponseBody int addorg(OrganizationBean bean,HttpSession httpSession) {
		UserBean user = (UserBean) httpSession.getAttribute("user");
		bean.setZzjgid(IdGen.uuid());
		bean.setCreateBy(user.getYhid());
		bean.setUpdateBy(user.getYhid());
		return organizationService.addorg(bean);
	}
	
	@RequestMapping("/getuserlist")
	public @ResponseBody Map getlist(UserBean bean) {
		Map map = userService.selectuserlist(bean);
		return map;
	}
	
	@RequestMapping("/delorg")
	public @ResponseBody int delorg(OrganizationBean bean) {
		return organizationService.delorg(bean);
	}
	@RequestMapping("/updateorg")
	public @ResponseBody int updateorg(OrganizationBean bean) {
		return organizationService.updateorg(bean);
	}
	
	@RequestMapping("/updateandaddorg")
	public @ResponseBody int updateandaddorg(OrganizationBean bean,HttpSession httpSession) {
		UserBean user = (UserBean) httpSession.getAttribute("user");
		int flag=0;
		if(StringUtils.isNotEmpty(bean.getZzjgid())){
			bean.setUpdateBy(user.getYhid());
			flag=organizationService.updateorg(bean);//修改
			if(flag==1){
				flag=1;
			}else{
				flag=2;
			}
		}else{
			bean.setZzjgid(IdGen.uuid());
			bean.setCreateBy(user.getYhid());
			bean.setUpdateBy(user.getYhid());
			OrganizationBean testbean = organizationService.selectbyid(bean.getSjzzjgid());
			String sfyzdw = testbean.getSfyzdw();
			bean.setSfyzdw(sfyzdw);
			flag=organizationService.addorg(bean);
			if(flag==1){
				flag=3;
			}else{
				flag=4;
			}
		}
		return flag;
	}
	
	@RequestMapping("/getorglisttype")
	public @ResponseBody List<OrganizationBean> getorglisttype(OrganizationBean bean) {
		return organizationService.getorglisttype(bean);
	}

}
