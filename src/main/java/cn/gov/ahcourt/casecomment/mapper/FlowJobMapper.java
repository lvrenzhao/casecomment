package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.FlowJobBean;

import java.util.List;
public interface FlowJobMapper {

	List<FlowJobBean> selectList(FlowJobBean bean);

	FlowJobBean selectById(String id);

	int insertSelective(FlowJobBean bean);

	int updateByIdSelective(FlowJobBean bean);

	int delete(String id);
	
	int deleteByshnrid(String id);

	int insertbyRw(FlowJobBean bean);

}
