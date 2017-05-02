package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasecheckPf;
import java.util.List;

public interface BdCasecheckPfMapper {
    int deleteByPrimaryKey(String pfid);

    int insert(BdCasecheckPf record);

    BdCasecheckPf selectByPrimaryKey(String pfid);

    List<BdCasecheckPf> selectAll();

    int updateByPrimaryKey(BdCasecheckPf record);
}