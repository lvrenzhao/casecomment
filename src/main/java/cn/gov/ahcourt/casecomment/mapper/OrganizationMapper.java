package cn.gov.ahcourt.casecomment.mapper;

import java.util.List;
import cn.gov.ahcourt.casecomment.bean.OrganizationBean;

public interface OrganizationMapper {

	List<OrganizationBean> selectList(OrganizationBean record);

	int insertSelective(OrganizationBean record);

	int updateByIdSelective(OrganizationBean record);

	int deleteSelective(OrganizationBean record);

	List<OrganizationBean> getlist(OrganizationBean bean);
	
	List<OrganizationBean> getorglist();
	
	int delorg(OrganizationBean record);
	
	int updateorg(OrganizationBean record);
	
	OrganizationBean selectbyid(String zzjgid);

	String getNameById(String zzjgid);
	
	List<OrganizationBean> getorglisttype(OrganizationBean bean);
	
	int insertzzjgziji(OrganizationBean record);

}
