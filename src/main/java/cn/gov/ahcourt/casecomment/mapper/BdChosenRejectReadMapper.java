package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdChosenRejectRead;
import java.util.List;

public interface BdChosenRejectReadMapper {
    int deleteByPrimaryKey(String readid);

    int insert(BdChosenRejectRead record);

    BdChosenRejectRead selectByPrimaryKey(String readid);

    List<BdChosenRejectRead> selectAll(BdChosenRejectRead bean);

    int updateByPrimaryKey(BdChosenRejectRead record);
}