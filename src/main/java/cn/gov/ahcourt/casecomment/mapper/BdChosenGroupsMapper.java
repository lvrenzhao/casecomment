package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdChosenGroups;
import java.util.List;

public interface BdChosenGroupsMapper {
    int deleteByPrimaryKey(String cgid);

    int insert(BdChosenGroups record);

    BdChosenGroups selectByPrimaryKey(String cgid);

    List<BdChosenGroups> selectAll();

    int updateByPrimaryKey(BdChosenGroups record);
}