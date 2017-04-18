package cn.gov.ahcourt.casecomment.service;

import java.util.List;

import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.RoleBean;
import cn.gov.ahcourt.casecomment.mapper.RoleMapper;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import org.springframework.stereotype.Service;


@Service
public class RoleService {

	@Resource
	private RoleMapper roleMapper;

	public List<RoleBean> selectList(RoleBean bean) {
		return roleMapper.selectList(bean);
	}

	public int deleteById(String id) {
		return roleMapper.deleteSelective(id);
	}

	public int insertSelective(RoleBean bean) {
		bean.setId(IdGen.uuid());
		return roleMapper.insertSelective(bean);
	}
	
	public RoleBean selectrolebyid(String id) {
		return roleMapper.selectrolebyid(id);
	}

}
