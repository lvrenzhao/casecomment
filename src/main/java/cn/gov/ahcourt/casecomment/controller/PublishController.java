package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.BdPublish;
import cn.gov.ahcourt.casecomment.bean.SdProfessional;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.BdPublishMapper;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import cn.gov.ahcourt.casecomment.utils.TimeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/publish")
public class PublishController {

	@Resource
	private BdPublishMapper bdPublishMapper;

	@RequestMapping(value = "/input", method = { RequestMethod.GET, RequestMethod.POST })
	public String input(ModelMap modelMap, String mode , String xxid) {
		modelMap.addAttribute("mode", mode);
		if (StringUtils.isNoneBlank(xxid)){
			BdPublish querybean = new BdPublish();
			querybean.setXxid(xxid);
			List<BdPublish> ls = bdPublishMapper.selectAll();
			BdPublish bean =  (ls !=null)?ls.get(0):null;
			modelMap.addAttribute("publish", bean);
		}
		return "publish/input";
	}

	@RequestMapping(value = "/verify", method = { RequestMethod.GET, RequestMethod.POST })
	public String verify() {
		return "publish/verify";
	}
	@RequestMapping(value = "/unwatch", method = { RequestMethod.GET, RequestMethod.POST })
	public String unwatch() {
		return "publish/unwatch";
	}
	@RequestMapping(value = "/watched", method = { RequestMethod.GET, RequestMethod.POST })
	public String watched() {
		return "publish/watched";
	}

	@RequestMapping(value = "/mylist", method = { RequestMethod.GET, RequestMethod.POST })
	public String mylist() {
		return "publish/mylist";
	}

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list() {
		return "publish/list";
	}

	@RequestMapping(value = "/save", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int save(BdPublish bean,@SessionScope("user")UserBean user){
		if(bean!=null && StringUtils.isNoneBlank(bean.getXxid())){
			return bdPublishMapper.updateByPrimaryKey(bean);
		}else{
			bean.setXxid(IdGen.uuid());
			bean.setRemarks("80301"); //设置状态为待审核。
			bean.setCreateBy(user.getYhid());
			bean.setCreateDate(TimeUtils.format());
			return bdPublishMapper.insert(bean);
		}
	}

	@RequestMapping("/mylistjson")
	public @ResponseBody
	Map mylistjson(BdPublish bean) {
		return bean.toMap(bdPublishMapper.selectMyList(bean));
	}

}
