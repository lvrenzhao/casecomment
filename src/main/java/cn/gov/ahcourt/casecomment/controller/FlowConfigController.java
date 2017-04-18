package cn.gov.ahcourt.casecomment.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.*;
import cn.gov.ahcourt.casecomment.service.*;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

@Controller
@RequestMapping("/setting/flowconfig")
public class FlowConfigController {

	@Resource
	private FlowConfigService flowConfigService;
	@Resource
	private FlowConfigFieldService flowConfigFieldService;
	@Resource
	private FlowConfigRoleService flowConfigRoleService;
	@Resource
	private DictService dictService;
	@Resource
	private RoleService roleService;
	@Resource
	private OrganizationService organizationService;
	private String whitespace = "|---------------------------------------------------------------------------------------------";

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String index(ModelMap model) {
		return "setting/verifyflow/diagram/verifyflow_list";
	}

	//启用图形化流程配置后，该方法已经过时
	@RequestMapping(value = "/input", method = { RequestMethod.GET, RequestMethod.POST })
	public String input() {
		return "setting/verifyflow/verifyflow_input";
	}
	//图形化流程配置入口
	@RequestMapping(value = "/diagraminput", method = { RequestMethod.GET, RequestMethod.POST })
	public String diagramDetails(ModelMap model,String mode,String lcmkid, String lcbb,String lcmkmc,String lcqyrq) {
		model.addAttribute("mode", mode);
		model.addAttribute("lcmkid", lcmkid);
		model.addAttribute("lcbb", lcbb);
		model.addAttribute("lcmkmc", lcmkmc);
		model.addAttribute("lcqyrq", lcqyrq);
		return "setting/verifyflow/diagram/verifyflow_diagram";
	}
	

	@RequestMapping(value = "/getList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<FlowConfigBean> getlist(FlowConfigBean entity) {
		return flowConfigService.selectList(entity);
	}

	@RequestMapping(value = "/getView", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<FlowConfigBean> getView(FlowConfigBean entity) {
		return flowConfigService.selectView(entity);
	}

	@RequestMapping(value = "/getNext", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int getnextversion(String lcmk) {
		return flowConfigService.getNextVersion(lcmk);
	}

	@RequestMapping(value = "/edit", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int update(FlowConfigBean entity) {
		return flowConfigService.updateByIdSelective(entity);
	}

	@RequestMapping(value = "/del", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int delete(String id) {
		if (StringUtils.isBlank(id)) {
			return 0;
		}
		return flowConfigService.deleteSelective(id);
	}

	@RequestMapping(value = "/addList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int insert(@SessionScope("user") UserBean user, String starttime, String rowlist, String version, String mk) {
		List<Map> list = JSONArray.parseArray(rowlist, Map.class);
		if (flowConfigService.insertList(user.getYhid(), list, starttime, version, mk)) {
			return 1;
		} else {
			return 0;
		}
	}

	@RequestMapping(value = "/getField", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<FlowConfigFieldBean> selectField(String lcmk) {
		FlowConfigFieldBean bean = new FlowConfigFieldBean();
		bean.setLcmk(lcmk);
		bean.setFlag("1");
		return flowConfigFieldService.selectList(bean);
	}

	@RequestMapping(value = "/addRole", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int addRole(@SessionScope("user") UserBean user, FlowConfigRoleBean bean) {
		bean.setCreate_by(user.getYhid());
		bean.setUpdate_by(user.getYhid());
		return flowConfigRoleService.insertSelective(bean);
	}
	
	@RequestMapping(value = "/getLcbbByLcmkid", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<FlowConfigBean> getLcbbByLcmkid(String lcmkid) {
		List<FlowConfigBean> flowlist = flowConfigService.selectGroup(lcmkid);
		return flowlist;
	}
	
	
	
	
	//=======================================图形化界面流程配置器新增方法========================================
	
	@RequestMapping(value = "/getTX", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<FlowConfigTxBean> getTX(String lcmk, String lcbb) {
		FlowConfigTxBean bean = new FlowConfigTxBean();
		bean.setLcbb(lcbb);
		bean.setLcmk(lcmk);
		List<FlowConfigTxBean> lst = flowConfigService.selectTxList(bean);
		return lst;
	}
	
	@RequestMapping(value = "/SaveTX", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int SaveTX(FlowConfigTxBean bean) {
		
		//循环添加流程环节
		List<FlowConfigBean> fcbs = JSONArray.parseArray(bean.getSteps(), FlowConfigBean.class);
		for(int i = 0 ; fcbs!=null && i<fcbs.size(); i ++){
			FlowConfigBean fcb = fcbs.get(i);
			String configid = IdGen.uuid();
			fcb.setId(configid);
			if(fcb.getZtid() != null && fcb.getZtid().indexOf("_")>-1){
				fcb.setZtid(fcb.getZtid().split("_")[0]);
			}
			flowConfigService.insertSelective(fcb);
			//循环添加每个环节中的条件配置
			List<FlowConfigRoleBean> fcrbs = JSONArray.parseArray(fcb.getRules(), FlowConfigRoleBean.class);
			for(int j = 0 ; fcrbs!=null && j<fcrbs.size(); j ++){
				FlowConfigRoleBean fcrb = fcrbs.get(j);
				fcrb.setLcpzid(configid);
				fcrb.setId(IdGen.uuid());
				flowConfigRoleService.insertSelective(fcrb);
			}
		}
		//最后保存图形数据
		bean.setTxid(IdGen.uuid());
		int i = flowConfigService.insertFlowConfigTx(bean);
		return i;
	}
	
	@RequestMapping(value = "/getConditionList", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<FlowConfigBean> getConditionList(String lcmkid) {
		return null;
	}
	
	@RequestMapping(value = "/getRoles", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<RoleBean> getRoles(RoleBean bean) {
		return roleService.selectList(bean);	
	}
	
	@RequestMapping(value = "/getJobs", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<DictBean> getJobs() {
		DictBean dictbean = new DictBean();
		dictbean.setSjzdbh("104");
		List<DictBean> dictlist = dictService.selectList(dictbean);
		return dictlist;
	}
	
	@RequestMapping(value = "/getDic", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<DictBean> getDic(String dicgroup) {
		DictBean dictbean = new DictBean();
		dictbean.setSjzdbh(dicgroup);
		List<DictBean> dictlist = dictService.selectList(dictbean);
		return dictlist;
	}
	
	@RequestMapping(value = "/getDepartement", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<OrganizationBean> getDepartement() {
		List<OrganizationBean> newList = new ArrayList<OrganizationBean>();
		OrganizationBean ob = new OrganizationBean();
		ob.setSjzzjgid("0");
		ob.setSfyzdw("false");
		List<OrganizationBean> list = organizationService.selectList(ob);
		getbysjzz(list,newList,new Integer(0));
		return newList;
	}
	
	private void getbysjzz(List<OrganizationBean> list,List<OrganizationBean> NewList,Integer level){
		level ++;
		if(list != null && list.size() > 0){
			for(int i = 0 ;  i<list.size(); i ++){
				String jgmc = whitespace.substring(0, level*3) + list.get(i).getZzjgmc();
				list.get(i).setZzjgmc(jgmc);
				NewList.add(list.get(i));
				OrganizationBean ob = new OrganizationBean();
				ob.setSjzzjgid(list.get(i).getZzjgid());
				ob.setSfyzdw("false");
				List<OrganizationBean> sublist = organizationService.selectList(ob);
				getbysjzz(sublist,NewList,level);
			}
		}
	}
	
}
