package cn.gov.ahcourt.casecomment.mapper;

import java.util.List;

import cn.gov.ahcourt.casecomment.bean.RoleMenuBean;
import org.apache.ibatis.annotations.Param;


public interface RoleMenuMapper {

	List<RoleMenuBean> selectList(RoleMenuBean record);

	int insertSelective(@Param("list") List<RoleMenuBean> list);

	int updateByIdSelective(RoleMenuBean record);

	int deleteSelective(String jsid);

}
