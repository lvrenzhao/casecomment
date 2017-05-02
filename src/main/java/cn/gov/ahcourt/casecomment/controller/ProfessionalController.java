package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.SdProfessional;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.SdProfessionalMapper;
import cn.gov.ahcourt.casecomment.service.UserService;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/setting/professional")
public class ProfessionalController {


	@Resource
	private SdProfessionalMapper sdProfessionalMapper;

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list() {
		return "/setting/professional/list";
	}

	@RequestMapping(value = "/input", method = { RequestMethod.GET, RequestMethod.POST })
	public String input(String mode , String zjid, ModelMap modelMap) {
		modelMap.addAttribute("mode",mode);
		if (StringUtils.isNoneBlank(zjid)){
			modelMap.addAttribute("zjid",zjid);
			SdProfessional querybean = new SdProfessional();
			querybean.setZjid(zjid);
			List<SdProfessional> ls = sdProfessionalMapper.select(querybean);
			SdProfessional bean =  (ls !=null)?ls.get(0):null;
			modelMap.addAttribute("professional", bean);
		}
		return "/setting/professional/input";
	}

	@RequestMapping("/listjson")
	public @ResponseBody Map listjson(SdProfessional bean) {
		return bean.toMap(sdProfessionalMapper.select(bean));
	}

	@RequestMapping(value = "/delete", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int deleteCustomer(String zjid) {
		return sdProfessionalMapper.deleteByPrimaryKey(zjid);
	}

	@RequestMapping(value = "/save", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody int save(SdProfessional bean){
		if(bean!=null && StringUtils.isNoneBlank(bean.getZjid())){
			return sdProfessionalMapper.updateByPrimaryKey(bean);
		}else{
			bean.setZjid(IdGen.uuid());
			return sdProfessionalMapper.insert(bean);
		}
	}

}
