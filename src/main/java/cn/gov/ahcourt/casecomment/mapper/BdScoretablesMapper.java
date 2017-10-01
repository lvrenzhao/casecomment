package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdScoretables;
import java.util.List;

public interface BdScoretablesMapper {
    int deleteByPrimaryKey(String tableid);

    int insert(BdScoretables record);

    BdScoretables selectByPrimaryKey(String tableid);

    List<BdScoretables> selectAll(BdScoretables bean);

    int updateByPrimaryKey(BdScoretables record);
}