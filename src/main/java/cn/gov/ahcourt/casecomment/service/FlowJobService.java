package cn.gov.ahcourt.casecomment.service;

import java.util.List;
import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.FlowJobBean;
import cn.gov.ahcourt.casecomment.mapper.FlowJobMapper;
import org.springframework.stereotype.Service;

@Service
public class FlowJobService {

	@Resource
	private FlowJobMapper flowjobMapper;

	public FlowJobBean getJobBynrid(String nrid, String lcmk) {
		FlowJobBean bean = new FlowJobBean();
		bean.setShnrid(nrid);
		bean.setLcmk(lcmk);
		List<FlowJobBean> list = flowjobMapper.selectList(bean);
		if (list != null && list.size() > 0)
			return list.get(0);
		return null;
	}

	public List<FlowJobBean> selectList(FlowJobBean bean) {
		return flowjobMapper.selectList(bean);
	}

	public int insertSelective(FlowJobBean bean) {
		return flowjobMapper.insertSelective(bean);
	}

	public int updateByIdSelective(FlowJobBean bean) {
		return flowjobMapper.updateByIdSelective(bean);
	}

	public int deleteSelective(String id) {
		return flowjobMapper.delete(id);
	}

	public FlowJobBean selectById(String jobid) {
		return flowjobMapper.selectById(jobid);
	}

}
