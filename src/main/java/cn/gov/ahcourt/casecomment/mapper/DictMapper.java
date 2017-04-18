package cn.gov.ahcourt.casecomment.mapper;

import java.util.List;

import cn.gov.ahcourt.casecomment.bean.DictBean;

public interface DictMapper {

	List<DictBean> selectList(DictBean record);

	List<DictBean> selectListByGroup(String zdbh);

	DictBean selectByName(String sjzdbh, String zdmc);

	String selectBhByNameSet(String sjzdbh, String zdmc);

	String getNextId(String sjzdbh);

	int insertSelective(DictBean record);

	int updateByIdSelective(DictBean record);

	int deleteSelective(DictBean record);

	String getName(String str);

	List<DictBean> selectListByP(String pid, String yhid, String xmid);

	String getRegion(String gcdz);

	String getBl(DictBean dict);

	List<DictBean> selectListByParents(String parent_ids);

}
