package cn.gov.ahcourt.casecomment.service;

import java.util.List;

import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.FlowHistoryBean;
import cn.gov.ahcourt.casecomment.mapper.FlowHistoryMapper;
import org.springframework.stereotype.Service;


@Service
public class FlowHistoryService {

	@Resource
	private FlowHistoryMapper flowhistoryMapper;

	public List<FlowHistoryBean> selectList(FlowHistoryBean bean) {
		return flowhistoryMapper.selectList(bean);
	}

	public int insertSelective(FlowHistoryBean bean) {
		return flowhistoryMapper.insertSelective(bean);
	}

	public int updateByIdSelective(FlowHistoryBean bean) {
		return flowhistoryMapper.updateByIdSelective(bean);
	}

	public int deleteSelective(FlowHistoryBean bean) {
		return flowhistoryMapper.deleteSelective(bean);
	}

	public String selectlastshyj(String shnrid) {
		return flowhistoryMapper.selectlastshyj(shnrid);
	}

}
