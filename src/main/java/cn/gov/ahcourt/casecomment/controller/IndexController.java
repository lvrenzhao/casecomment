package cn.gov.ahcourt.casecomment.controller;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import java.io.*;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;

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

    @RequestMapping(value = "splayer", method = RequestMethod.GET)
    public void splayer(final HttpServletRequest request,final HttpServletResponse response) throws IOException {

        String filename = request.getSession().getServletContext().getRealPath("/assets/v1.mp4");
        File file = new File(filename);

        int length = (int)file.length();
        int start = 0;
        int end = length - 1;

        String range = request.getHeader("Range");
        System.out.println(range);

        int contentLength = end - start + 1;

        response.reset();
        response.setBufferSize(4 * 1024);
        response.setHeader("Content-Disposition",
                String.format("inline;filename=\"%s\"", "v1.mp4"));
        response.setHeader("Accept-Ranges", "bytes");
        response.setContentType("video/mp4");
        response.setHeader("Content-Range",
                String.format("bytes %s-%s/%s", start, end, length));
        response.setHeader("Content-Length", String.format("%s", contentLength));
        response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);

        InputStream in = null;
        ServletOutputStream out = null;
        try {
            in = new FileInputStream(file);
            out = response.getOutputStream();
            byte[] buffer = new byte[4 * 1024];
            int t_length;
            while ((t_length = in.read(buffer)) > 0) {
                out.write(buffer, 0, t_length);
            }
        } catch (FileNotFoundException e) {
            System.out.println("文件读取失败,文件不存在");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("文件流输出异常");
            e.printStackTrace();
        } finally {
            try {
                in.close();
                out.close();
            } catch (IOException e) {
                System.out.println("文件流关闭异常");
                e.printStackTrace();
            }
        }


//        int bytesRead;
//        int bytesLeft = contentLength;
//        ByteBuffer buffer = ByteBuffer.allocate(8192);
//
//        try (SeekableByteChannel = Files.newByteChannel(video, READ);
//             OutputStream output = response.getOutputStream()) {
//
//            input.position(start);
//
//            while ((bytesRead = input.read(buffer)) != -1 && bytesLeft > 0) {
//                buffer.clear();
//                output.write(buffer.array(), 0,
//                        bytesLeft < bytesRead ? bytesLeft : bytesRead);
//                bytesLeft -= bytesRead;
//            }
//        }
    }


    @RequestMapping(value = "/userlist", method = { RequestMethod.GET, RequestMethod.POST })
    public @ResponseBody Map userlist(@SessionScope("user") UserBean yh, UserBean user) {
        user.setYhid(yh.getYhid());
        Map map = user.toMap(userService.select(user));
        return map;
    }

    @RequestMapping(value = "/userlistpro", method = { RequestMethod.GET, RequestMethod.POST })
    public @ResponseBody Map userlistpro(@SessionScope("user") UserBean yh, UserBean user) {
        user.setYhid(yh.getYhid());
        Map map = user.toMap(userService.selectwithoutpro(user));
        return map;
    }

    private void initMenusByRole(List<MenuBean> menus,UserBean user){
        for(int i = 0 ; menus!=null && i< menus.size(); i++){
            if(StringUtils.isEmpty(menus.get(i).getCdurl())){
                List<MenuBean> submenus = menuService.getMenusByParentID(menus.get(i).getCdid(), user.getJsid());
                menus.get(i).setSubmenus(submenus);
                initMenusByRole(submenus,user);
            }
        }
    }
}
