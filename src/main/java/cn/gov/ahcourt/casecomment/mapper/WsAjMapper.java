package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.WsAj;
import cn.gov.ahcourt.casecomment.bean.WsAjid;

import java.util.List;

public interface WsAjMapper {

    int insert(WsAj record);

    List<WsAj> selectAll(WsAj record);

    int updateByPrimaryKey(WsAj record);

    WsAj getCount(WsAj record);
}