package cn.gov.ahcourt.casecomment.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.gov.ahcourt.casecomment.utils.SessionScope;
import cn.gov.ahcourt.casecomment.bean.FileBean;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.service.FileService;
import cn.gov.ahcourt.casecomment.utils.HttpRequestDeviceUtils;

@Controller
@RequestMapping("/setting/file")
public class FileController {

	@Resource
	FileService fileService;

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list() {
		return "setting/file/list";
	}

	@RequestMapping(value = "/getList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Map<String, Object> getlist(FileBean entity) {
		return entity.toMap(fileService.select(entity));
	}

	@RequestMapping(value = "/getTypeList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<String> selectTypes(FileBean entity) {
		return fileService.selectTypes();
	}

	@RequestMapping(value = "/delFile", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int delFile(@RequestParam(value = "id", required = true) String id) {
		return fileService.deleteFile(id);
	}

	@RequestMapping(value = "/fileupload", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Map<String, Object> fileUpload(@RequestHeader HttpHeaders headers, HttpServletResponse response, @RequestParam(value = "file", required = true) MultipartFile file,
			@SessionScope("user") UserBean user) {
		String via = headers.getFirst("Via");
		String userAgent = headers.getFirst("user-agent");
		if (HttpRequestDeviceUtils.isMobileDevice(via, userAgent)) {
			System.out.println(userAgent);
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("Access-Control-Allow-Methods", "POST");
		}
		return fileService.addFile(file, user);
	}

	@RequestMapping(value = "/download/{fileid}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView download(@PathVariable("fileid") String fileid, HttpServletResponse response, @RequestHeader HttpHeaders headers) {
		String via = headers.getFirst("Via");
		String userAgent = headers.getFirst("user-agent");
		if (HttpRequestDeviceUtils.isMobileDevice(via, userAgent)) {
			System.out.println(userAgent);
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("Access-Control-Allow-Methods", "POST");
		}
		return fileService.download(fileid, response);
	}

	@RequestMapping(value = "/downloadzip")
	public @ResponseBody ModelAndView downloadzip(HttpServletResponse response, @SessionScope("user") UserBean user, String id) {
		List<String> list = new ArrayList<String>();
		String[] newstr = id.split(",");
		for (int i = 0; i < newstr.length; i++) {
			list.add(newstr[i]);
		}
		List<FileBean> filelist = fileService.download(list);
		return fileService.downloadzip(filelist, response, "附件");
	}
}
