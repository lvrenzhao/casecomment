package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.SdLogs;
import java.util.List;

public interface SdLogsMapper {
    int deleteByPrimaryKey(String logid);

    int insert(SdLogs record);

    SdLogs selectByPrimaryKey(String logid);

    List<SdLogs> selectAll();

    List<SdLogs> select(SdLogs bean);


    int updateByPrimaryKey(SdLogs record);
}