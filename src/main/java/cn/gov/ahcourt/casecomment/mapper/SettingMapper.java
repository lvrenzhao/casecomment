package cn.gov.ahcourt.casecomment.mapper;

import java.util.List;

import cn.gov.ahcourt.casecomment.bean.SettingBean;
import org.apache.ibatis.annotations.Param;

public interface SettingMapper {

	List<SettingBean> selectList(SettingBean bean);

	SettingBean selectByPrimaryKey(String szid);
	SettingBean selectByKey(String key);

	int insertSelective(SettingBean bean);

	int updateByKeySelective(SettingBean bean);

	int deleteByPrimaryKey(String szid);
	
	int deleteBySetKey(String setkey);

	SettingBean selectCount(@Param("setkey") String setkey, @Param("create_by") String create_by);

}
