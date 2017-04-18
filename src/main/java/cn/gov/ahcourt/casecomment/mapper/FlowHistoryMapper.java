package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.FlowHistoryBean;

import java.util.List;

public interface FlowHistoryMapper {

	List<FlowHistoryBean> selectList(FlowHistoryBean bean);

	int insertSelective(FlowHistoryBean bean);

	int updateByIdSelective(FlowHistoryBean bean);

	int deleteSelective(FlowHistoryBean bean);

	List<FlowHistoryBean> historyList(String entityid, String lcmk);

	String selectlastshyj(String shnrid);

}
