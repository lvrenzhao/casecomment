package cn.gov.ahcourt.casecomment.mapper;

import java.util.List;
import java.util.Map;

import cn.gov.ahcourt.casecomment.bean.FlowConfigBean;
import org.apache.ibatis.annotations.Param;


public interface FlowMapper {

	int getsfzhyb(String lcmk, String lxbb, int dqbz);

	int updateJob(@Param("jobid") String jobid, @Param("config") FlowConfigBean bean, @Param("updateby") String updateby);

	int updatenextcgsh(String rwid, String zjid, String updateby);

	String getzj(String rwid);

	int deleteOld(String entityid, String lcmk);

	List<Map<String, Object>> selectFlowRole(String lcpzid);

	int checkFlowConfig(@Param("shnrid") String shnrid, @Param("sqr") String sqr, @Param("lcmk") String lcmk, @Param("list") List<Map<String, Object>> list);

	int insertJob(@Param("shnrid") String shnrid, @Param("config") FlowConfigBean configBean, @Param("yhid") String yhid);
}
