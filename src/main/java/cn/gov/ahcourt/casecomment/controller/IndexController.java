package cn.gov.ahcourt.casecomment.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import cn.gov.ahcourt.casecomment.bean.MenuBean;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.UserMapper;
import cn.gov.ahcourt.casecomment.service.MenuService;
import cn.gov.ahcourt.casecomment.service.UserService;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class IndexController {

    @Resource
    private MenuService menuService;
    @Resource
    private UserService userService;


    @RequestMapping("/index")
    public String index(HttpSession httpSession){
    	UserBean user = (UserBean)httpSession.getAttribute("user");
    	if(user == null || StringUtils.isEmpty(user.getZh())){
    		return "redirect:/login.do";
    	}
    	//加载菜单(递归)
        List<MenuBean> menus = menuService.getMenusByParentID("0", user.getJsid());
        initMenusByRole(menus,user);
        httpSession.setAttribute("menus", menus);

        return "../index";
    }

    @RequestMapping("/player")
    public String player(String vid){
        return "casecheck/check/player";
    }

    public void initMenusByRole(List<MenuBean> menus,UserBean user){
        for(int i = 0 ; menus!=null && i< menus.size(); i++){
            if(StringUtils.isEmpty(menus.get(i).getCdurl())){
                List<MenuBean> submenus = menuService.getMenusByParentID(menus.get(i).getCdid(), user.getJsid());
                menus.get(i).setSubmenus(submenus);
                initMenusByRole(submenus,user);
            }
        }
    }

    @RequestMapping(value = "/userlist", method = { RequestMethod.GET, RequestMethod.POST })
    public @ResponseBody Map userlist(@SessionScope("user") UserBean yh, UserBean user) {
        user.setYhid(yh.getYhid());
        Map map = user.toMap(userService.select(user));
        return map;
    }

}
