package cn.gov.ahcourt.casecomment.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.gov.ahcourt.casecomment.bean.OrganizationBean;
import cn.gov.ahcourt.casecomment.mapper.OrganizationMapper;

@Service
public class OrganizationService {

	@Resource
	OrganizationMapper organizationMapper;

	public List<OrganizationBean> getlist(OrganizationBean bean) {
		return organizationMapper.getlist(bean);
	}
	
	public List<OrganizationBean> selectList(OrganizationBean bean) {
		return organizationMapper.selectList(bean);
	}
	
	public List<OrganizationBean> getorglist() {
		return organizationMapper.getorglist();
	}
	
	
	public int addorg(OrganizationBean bean) {
		return organizationMapper.insertSelective(bean);
	}
	
	public int insertzzjgziji(OrganizationBean bean) {
		return organizationMapper.insertzzjgziji(bean);
	}
	
	public int delorg(OrganizationBean bean) {
		return organizationMapper.delorg(bean);
	}
	
	public int updateorg(OrganizationBean bean) {
		return organizationMapper.updateorg(bean);
	}
	
	public OrganizationBean selectbyid(String zzjgid) {
		return organizationMapper.selectbyid(zzjgid);
	}

	public String getNameById(String zzjgid) {
		return organizationMapper.getNameById(zzjgid);
	}
	
	public List<OrganizationBean> getorglisttype(OrganizationBean bean) {
		return organizationMapper.getorglisttype(bean);
	}

}
