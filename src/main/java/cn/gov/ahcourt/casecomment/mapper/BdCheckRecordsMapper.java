package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCheckRecords;
import java.util.List;

public interface BdCheckRecordsMapper {
    int deleteByPrimaryKey(String crid);

    int insert(BdCheckRecords record);

    BdCheckRecords selectByPrimaryKey(String crid);

    List<BdCheckRecords> selectAll();

    int updateByPrimaryKey(BdCheckRecords record);
}