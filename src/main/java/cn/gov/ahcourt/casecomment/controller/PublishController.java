package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.*;
import cn.gov.ahcourt.casecomment.mapper.BdPublishMapper;
import cn.gov.ahcourt.casecomment.mapper.BdPublishReadMapper;
import cn.gov.ahcourt.casecomment.service.FlowService;
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

	@Resource
	private BdPublishReadMapper bdPublishReadMapper;

	@Resource
	private FlowService flowService;

	@RequestMapping(value = "/input", method = { RequestMethod.GET, RequestMethod.POST })
	public String input(ModelMap modelMap, String mode , String xxid,String jobid,@SessionScope("user")UserBean user) {
		modelMap.addAttribute("mode", mode);
		modelMap.addAttribute("jobid", jobid);
		if (StringUtils.isNoneBlank(xxid)){
			BdPublish querybean = new BdPublish();
			querybean.setXxid(xxid);
			BdPublish bean = bdPublishMapper.selectByPrimaryKey(xxid);
			modelMap.addAttribute("publish", bean);

			BdPublishRead bprbean = new BdPublishRead();
			bprbean.setYdr(user.getYhid());
			bprbean.setXxggid(xxid);
			List<BdPublishRead> bprs = bdPublishReadMapper.select(bprbean);
			if(bprs ==null || bprs.size() == 0){
				bprbean.setXxggydid(IdGen.uuid());
				bprbean.setYdsj(TimeUtils.format());
				bdPublishReadMapper.insert(bprbean);
			}
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
			String xxid = IdGen.uuid();
			bean.setXxid(xxid);
			bean.setRemarks("10601"); //设置状态为待审核。
			bean.setCreateBy(user.getYhid());
			bean.setCreateDate(TimeUtils.format());

			//注册工作流
			FlowResult result = new FlowResult();
			result = flowService.firstVerify(xxid, "10303", user);
			int i = -1;
			if (result.getResult()) {
				i = bdPublishMapper.insert(bean);
			}
			return i;
		}
	}

	@RequestMapping("/mylistjson")
	public @ResponseBody Map mylistjson(BdPublish bean,@SessionScope("user") UserBean user) {
		if (user == null) {
			return null;
		}
		bean.setCreateBy(user.getYhid());
		return bean.toMap(bdPublishMapper.selectMyList(bean));
	}

	@RequestMapping("/listjson")
	public @ResponseBody Map listjson(BdPublish bean,@SessionScope("user") UserBean user) {
		if (user == null) {
			return null;
		}
		return bean.toMap(bdPublishMapper.selectMyList(bean));
	}


	@RequestMapping("/verifylistjson")
	public @ResponseBody Map verifylistjson(BdPublish bean,@SessionScope("user") UserBean user) {
		if (user == null) {
			return null;
		}
		bean.setShr(user.getYhid());
		return bean.toMap(bdPublishMapper.selectVerifyList(bean));
	}

	@RequestMapping("/verifyhistorylistjson")
	public @ResponseBody Map verifyhistorylistjson(BdPublish bean,@SessionScope("user") UserBean user) {
		if (user == null) {
			return null;
		}
		bean.setShr(user.getYhid());
		return bean.toMap(bdPublishMapper.selectVerifyHistoryList(bean));
	}

	@RequestMapping("/doverify")
	public @ResponseBody FlowResult doverify(@SessionScope("user") UserBean user, String jobid, String shjg, String shyj) {
		FlowResult result = flowService.verify(jobid, shjg, shyj, user);
		if (result.getResult()) {
			BdPublish bean = bdPublishMapper.selectByPrimaryKey(result.getJob().getShnrid());
			if (result.isSfjs()) {
				bean.setRemarks(shjg);
			}
			bean.setUpdateBy(user.getYhid());
			bdPublishMapper.updateByPrimaryKey(bean);
		}
		return result;
	}

	@RequestMapping("/unwatchedlistjson")
	public @ResponseBody Map unwatchedlistjson(BdPublish bean,@SessionScope("user") UserBean user) {
		if (user == null) {
			return null;
		}
		bean.setCreateBy(user.getYhid());
		return bean.toMap(bdPublishMapper.selectUnwatchedList(bean));
	}

	@RequestMapping("/watchedlistjson")
	public @ResponseBody Map watchedlistjson(BdPublish bean,@SessionScope("user") UserBean user) {
		if (user == null) {
			return null;
		}
		bean.setCreateByMC(user.getYhid());
		return bean.toMap(bdPublishMapper.selectWatchedList(bean));
	}
}
