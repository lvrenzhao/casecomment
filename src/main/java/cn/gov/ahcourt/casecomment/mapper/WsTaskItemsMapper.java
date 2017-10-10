package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.WsTaskItems;
import java.util.List;

public interface WsTaskItemsMapper {
    int deleteByPrimaryKey(String taskitemid);

    int insert(WsTaskItems record);

    WsTaskItems selectByPrimaryKey(String taskitemid);

    List<WsTaskItems> selectAll();

    int updateByPrimaryKey(WsTaskItems record);
}