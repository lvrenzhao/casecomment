package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.FlowConfigRoleBean;

import java.util.List;

public interface FlowConfigRoleMapper {

	List<FlowConfigRoleBean> selectList(FlowConfigRoleBean bean);

	int selectCount(FlowConfigRoleBean bean);

	FlowConfigRoleBean selectByPrimaryKey(String id);

	int insertSelective(FlowConfigRoleBean bean);

	int updateByKeySelective(FlowConfigRoleBean bean);

	int deleteByPrimaryKey(String id);

	int deleteSelective(FlowConfigRoleBean bean);

}
