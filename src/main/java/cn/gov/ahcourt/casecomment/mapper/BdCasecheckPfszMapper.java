package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasecheckPfsz;
import java.util.List;

public interface BdCasecheckPfszMapper {
    int deleteByPrimaryKey(String ajpcpfxid);

    int insert(BdCasecheckPfsz record);

    BdCasecheckPfsz selectByPrimaryKey(String ajpcpfxid);

    List<BdCasecheckPfsz> selectAll();

    int updateByPrimaryKey(BdCasecheckPfsz record);
}