package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.UserBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface UserMapper {

	List<UserBean> selectList(UserBean record);
	
	UserBean selectOne(String yhid);

	//UserBean selectByGh(String gh);

	int insertSelective(UserBean record);

	int updateByIdSelective(UserBean record);

	int deleteSelective(UserBean record);

	UserBean getById(String yhid);

	List<UserBean> select(UserBean user);
	
	List<UserBean> selectuserlist(UserBean user);

	UserBean getUser(String yhid);
	
	List<UserBean> zhgllist(UserBean user);
	
	List<UserBean> getlistbyzzjgid(@Param("zzjgid") String zzjgid);
	
	List<UserBean> getlistbyzzjgids(UserBean user);

}
