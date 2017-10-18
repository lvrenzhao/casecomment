package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.WsAjid;
import java.util.List;

public interface WsAjidMapper {
    int deleteByPrimaryKey(String tdhajid);

    int insert(WsAjid record);

    WsAjid selectByPrimaryKey(String tdhajid);

    List<WsAjid> selectAll();

    int updateByPrimaryKey(WsAjid record);

    int deleteByFjm(String fjm);
}