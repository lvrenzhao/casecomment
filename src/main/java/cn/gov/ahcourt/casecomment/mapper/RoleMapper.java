package cn.gov.ahcourt.casecomment.mapper;

import java.util.List;

import cn.gov.ahcourt.casecomment.bean.RoleBean;
import org.apache.ibatis.annotations.Param;

public interface RoleMapper {

	List<RoleBean> selectList(RoleBean record);

	int insertSelective(RoleBean record);

	int updateByIdSelective(RoleBean record);

	int deleteSelective(RoleBean record);

	int deleteSelective(String id);

	String selectIdByNameSet(String jsmc);
	
	RoleBean selectrolebyid(@Param("id") String id);

}
