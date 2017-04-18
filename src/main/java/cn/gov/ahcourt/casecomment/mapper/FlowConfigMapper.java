package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.FlowConfigBean;
import cn.gov.ahcourt.casecomment.bean.FlowConfigTxBean;

import java.util.List;

public interface FlowConfigMapper {
	
	List<FlowConfigBean> selectList(FlowConfigBean record);

	List<FlowConfigBean> selectView(FlowConfigBean record);
	
	FlowConfigBean selectOne(FlowConfigBean record);

	List<FlowConfigBean> selectGroup(String lcmk);

	int getNextVersion(String lcmk);

	int insertSelective(FlowConfigBean record);

	int updateByIdSelective(FlowConfigBean record);

	int deleteSelective(FlowConfigBean record);

	int selectCountByLcmk(String string);
	
	List<FlowConfigBean> selectPrev(String id);
	
	List<FlowConfigBean> selectNext(String id);

	List<FlowConfigBean> selectByXh(String lcmk, String lcbb, int bzxh);

	int selectDqbb(String lcmk);
	

	List<FlowConfigTxBean> selectTxList(FlowConfigTxBean record);
	
	int insertFlowConfigTx(FlowConfigTxBean record);

}
