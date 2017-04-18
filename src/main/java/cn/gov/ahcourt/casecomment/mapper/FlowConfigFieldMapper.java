package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.FlowConfigFieldBean;

import java.util.List;

public interface FlowConfigFieldMapper {

	List<FlowConfigFieldBean> selectList(FlowConfigFieldBean bean);

	FlowConfigFieldBean selectByPrimaryKey(String id);

	int insertSelective(FlowConfigFieldBean bean);

	int updateByKeySelective(FlowConfigFieldBean bean);

	int deleteByPrimaryKey(String id);

	int deleteSelective(FlowConfigFieldBean bean);

}
