package cn.gov.ahcourt.casecomment.service;

import java.util.List;
import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.FlowConfigFieldBean;
import cn.gov.ahcourt.casecomment.mapper.FlowConfigFieldMapper;
import org.springframework.stereotype.Service;

@Service
public class FlowConfigFieldService {

	@Resource
	private FlowConfigFieldMapper flowConfigFieldMapper;

	public List<FlowConfigFieldBean> selectList(FlowConfigFieldBean bean) {
		return flowConfigFieldMapper.selectList(bean);
	}

	public FlowConfigFieldBean selectByPrimaryKey(String id) {
		return flowConfigFieldMapper.selectByPrimaryKey(id);
	}

	public int insertSelective(FlowConfigFieldBean bean) {
		return flowConfigFieldMapper.insertSelective(bean);
	}

	public int updateByKeySelective(FlowConfigFieldBean bean) {
		return flowConfigFieldMapper.updateByKeySelective(bean);
	}

	public int deleteByPrimaryKey(String id) {
		return flowConfigFieldMapper.deleteByPrimaryKey(id);
	}

	public int deleteSelective(FlowConfigFieldBean bean) {
		return flowConfigFieldMapper.deleteSelective(bean);
	}

}
