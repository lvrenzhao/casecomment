package cn.gov.ahcourt.casecomment.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.FlowConfigBean;
import cn.gov.ahcourt.casecomment.bean.FlowConfigTxBean;
import cn.gov.ahcourt.casecomment.mapper.FlowConfigMapper;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import org.springframework.stereotype.Service;


@Service
public class FlowConfigService {

	@Resource
	FlowConfigMapper flowconfigMapper;

	public List<FlowConfigBean> selectList(FlowConfigBean record) {
		return flowconfigMapper.selectList(record);
	}
	
	public List<FlowConfigTxBean> selectTxList(FlowConfigTxBean record) {
		return flowconfigMapper.selectTxList(record);
	}
	
	public List<FlowConfigBean> selectView(FlowConfigBean record) {
		return flowconfigMapper.selectView(record);
	}

	public List<FlowConfigBean> selectGroup(String lcmk) {
		return flowconfigMapper.selectGroup(lcmk);
	}

	public int getNextVersion(String lcmk) {
		return flowconfigMapper.getNextVersion(lcmk);
	}

	public int insertSelective(FlowConfigBean record) {
		return flowconfigMapper.insertSelective(record);
	}
	
	public int insertFlowConfigTx(FlowConfigTxBean record) {
		return flowconfigMapper.insertFlowConfigTx(record);
	}


	public boolean insertList(String yhid, List<Map> list, String starttime, String version, String mk) {
		for (int i = 0; i < list.size(); i++) {
			Map map = list.get(i);
			FlowConfigBean record = new FlowConfigBean();
			record.setId(IdGen.uuid());
			record.setLcmk(mk);
			record.setLcbb(version);
			record.setLcqyrq(starttime);
			record.setBzxh(i + 1);
			record.setHjmc(String.valueOf(map.get("name")));
			record.setZtlx(String.valueOf(map.get("zt_type")));
			record.setZtid(String.valueOf(map.get("zt")));
			record.setBtgthz(Integer.parseInt(String.valueOf(map.get("backto"))));
			record.setCreate_by(yhid);
			record.setUpdate_by(yhid);
			flowconfigMapper.insertSelective(record);
		}
		return true;
	}

	public int updateByIdSelective(FlowConfigBean record) {
		return flowconfigMapper.updateByIdSelective(record);
	}

	public int deleteSelective(String id) {
		FlowConfigBean entity = new FlowConfigBean();
		entity.setId(id);
		return flowconfigMapper.deleteSelective(entity);
	}
}
