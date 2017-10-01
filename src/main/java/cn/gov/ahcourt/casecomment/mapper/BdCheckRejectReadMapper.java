package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCheckRejectRead;
import java.util.List;

public interface BdCheckRejectReadMapper {
    int deleteByPrimaryKey(String readid);

    int insert(BdCheckRejectRead record);

    BdCheckRejectRead selectByPrimaryKey(String readid);

    List<BdCheckRejectRead> selectAll();

    int updateByPrimaryKey(BdCheckRejectRead record);
}