package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCheckDistribution;
import java.util.List;

public interface BdCheckDistributionMapper {
    int deleteByPrimaryKey(String cdid);

    int insert(BdCheckDistribution record);

    BdCheckDistribution selectByPrimaryKey(String cdid);

    List<BdCheckDistribution> selectAll(BdCheckDistribution bean);

    int updateByPrimaryKey(BdCheckDistribution record);
}