package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.WsAj;
import java.util.List;

public interface WsAjMapper {
    int deleteByPrimaryKey(String tdhajid);

    int insert(WsAj record);

    WsAj selectByPrimaryKey(String tdhajid);

    List<WsAj> selectAll();

    int updateByPrimaryKey(WsAj record);
}