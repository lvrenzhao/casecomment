package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasecheckPfsz;
import java.util.List;

public interface BdCasecheckPfszMapper {
    int insert(BdCasecheckPfsz record);

    List<BdCasecheckPfsz> selectAll();
}