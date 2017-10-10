package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.WsLog;
import java.util.List;

public interface WsLogMapper {
    int deleteByPrimaryKey(String errorid);

    int insert(WsLog record);

    WsLog selectByPrimaryKey(String errorid);

    List<WsLog> selectAll();

    int updateByPrimaryKey(WsLog record);
}