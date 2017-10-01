package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCheckGroups;
import java.util.List;

public interface BdCheckGroupsMapper {
    int deleteByPrimaryKey(String cgid);

    int insert(BdCheckGroups record);

    BdCheckGroups selectByPrimaryKey(String cgid);

    List<BdCheckGroups> selectAll(BdCheckGroups bean);

    int updateByPrimaryKey(BdCheckGroups record);
}