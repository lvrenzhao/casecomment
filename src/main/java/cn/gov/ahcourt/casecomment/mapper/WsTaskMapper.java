package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.WsTask;
import java.util.List;

public interface WsTaskMapper {
    int deleteByPrimaryKey(String taskid);

    int insert(WsTask record);

    WsTask selectByPrimaryKey(String taskid);

    List<WsTask> selectAll();

    int updateByPrimaryKey(WsTask record);
}