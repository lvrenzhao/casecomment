package cn.gov.ahcourt.casecomment.service;

import java.util.List;
import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.FlowConfigRoleBean;
import cn.gov.ahcourt.casecomment.mapper.FlowConfigRoleMapper;
import org.springframework.stereotype.Service;

@Service
public class FlowConfigRoleService {

	@Resource
	private FlowConfigRoleMapper flowConfigRoleMapper;

	public List<FlowConfigRoleBean> selectList(FlowConfigRoleBean bean) {
		return flowConfigRoleMapper.selectList(bean);
	}

	public int selectCount(FlowConfigRoleBean bean) {
		return flowConfigRoleMapper.selectCount(bean);
	}

	public FlowConfigRoleBean selectByPrimaryKey(String id) {
		return flowConfigRoleMapper.selectByPrimaryKey(id);
	}

	public int insertSelective(FlowConfigRoleBean bean) {
		return flowConfigRoleMapper.insertSelective(bean);
	}

	public int updateByKeySelective(FlowConfigRoleBean bean) {
		return flowConfigRoleMapper.updateByKeySelective(bean);
	}

	public int deleteByPrimaryKey(String id) {
		return flowConfigRoleMapper.deleteByPrimaryKey(id);
	}

	public int deleteSelective(FlowConfigRoleBean bean) {
		return flowConfigRoleMapper.deleteSelective(bean);
	}

}
