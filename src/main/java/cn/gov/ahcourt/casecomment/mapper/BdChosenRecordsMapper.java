package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdChosenRecords;
import java.util.List;

public interface BdChosenRecordsMapper {
    int deleteByPrimaryKey(String crid);

    int insert(BdChosenRecords record);

    BdChosenRecords selectByPrimaryKey(String crid);

    List<BdChosenRecords> selectAll(BdChosenRecords bean);

    int updateByPrimaryKey(BdChosenRecords record);
}