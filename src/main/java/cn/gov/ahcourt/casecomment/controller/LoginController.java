package cn.gov.ahcourt.casecomment.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.scheduled.*;
import cn.gov.ahcourt.casecomment.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.gov.ahcourt.casecomment.utils.StringUtils;


@Controller
public class LoginController {

	@Resource
	private UserService userService;

	@RequestMapping("/login")
	public String login(HttpSession httpSession) {
		return "../login";
	}


	@Resource
	private JobCaseInit jobCaseInit;
	@Resource
	private JobCaseUpdate jobCaseUpdate;
	@Resource
	private JobCaseConverter jobCaseConverter;
	@Resource
	private JobCaseFetcher jobCaseFetcher;
	@Resource
	private CaseFileFetcher caseFileFetcher;


	@RequestMapping("/checklogin")
	public String checklogin(String username, String password, HttpSession httpSession) {
		if (StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(password)) {
			UserBean user = userService.getByzh(username);
			if (user != null && user.getMm().equals(password)) {
				if("1".equals(user.getZhzt())) {
					httpSession.setAttribute("msg", "");//清空消息
					httpSession.setAttribute("user", user);
					httpSession.setAttribute("userid", user.getYhid());
					return "redirect:/index.do";
				}else{
					httpSession.setAttribute("msg", "账号被禁用，请联系系统管理员解禁。");//清空消息
					return "redirect:/login.jsp";
				}
			} else {
				httpSession.setAttribute("msg", "用户名或密码不正确");
			}
		} else {
			httpSession.setAttribute("msg", "用户名或密码不能为空");
		}
		httpSession.setAttribute("username", username);
		return "redirect:/login.jsp";
	}


	@RequestMapping("/logout")
	public String logout(HttpSession httpSession) {
		httpSession.removeAttribute("user");
		httpSession.setAttribute("msg", "已退出，请重新登录..");
		return "redirect:/";
	}

	@RequestMapping("/caseinit")
	public String caseinit(HttpSession httpSession) {
		jobCaseInit.doJob();
		return "redirect:/blank.jsp";
	}
	@RequestMapping("/caseupdate")
	public String caseupdate(HttpSession httpSession) {
		jobCaseUpdate.doJob();
		return "redirect:/blank.jsp";
	}

	@RequestMapping("/caseconvert")
	public String caseconvert(HttpSession httpSession) {
		jobCaseConverter.doJob();
		return "redirect:/blank.jsp";
	}

	@RequestMapping("/casefetch")
	public String casefetch(HttpSession httpSession) {
		jobCaseFetcher.doJob();
		return "redirect:/blank.jsp";
	}

	@RequestMapping("/filefetch")
	public String filefetch(HttpSession httpSession,HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("/files/");
		caseFileFetcher.doJob(path);
		return "redirect:/blank.jsp";
	}

}
