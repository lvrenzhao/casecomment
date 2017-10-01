package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdScoretableItems;
import java.util.List;

public interface BdScoretableItemsMapper {
    int deleteByPrimaryKey(String itemid);

    int insert(BdScoretableItems record);

    BdScoretableItems selectByPrimaryKey(String itemid);

    List<BdScoretableItems> selectAll(BdScoretableItems bean);

    int updateByPrimaryKey(BdScoretableItems record);
}