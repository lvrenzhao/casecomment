package cn.gov.ahcourt.casecomment.mapper;

import java.util.List;
import java.util.Map;

import cn.gov.ahcourt.casecomment.bean.MenuBean;
import org.apache.ibatis.annotations.Param;

public interface MenuMapper {

	int selectList(MenuBean record);

	int insertSelective(MenuBean record);

	int updateByIdSelective(MenuBean record);

	List<Map<String, Object>> selectTreeList(MenuBean menu);

	MenuBean getById(String cdid);

	int deleteById(String[] cdids);

	String getIds(String cdid);
	
	List<MenuBean> getMenusByParentID(@Param("parentid") String parentid, @Param("roleid") String roleid);
	List<MenuBean> getMenusByParentName(@Param("parentname") String parentname, @Param("roleid") String roleid);
	
	int updateMove(@Param("thisid") String id, @Param("targetid") String targetid, @Param("type") String type, @Param("yhid") String yhid);

}
