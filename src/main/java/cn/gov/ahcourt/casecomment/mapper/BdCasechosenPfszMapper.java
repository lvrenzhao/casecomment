package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasechosenPfsz;
import java.util.List;

public interface BdCasechosenPfszMapper {
    int deleteByPrimaryKey(String sjpxpfxid);

    int insert(BdCasechosenPfsz record);

    BdCasechosenPfsz selectByPrimaryKey(String sjpxpfxid);

    List<BdCasechosenPfsz> selectAll();

    int updateByPrimaryKey(BdCasechosenPfsz record);
}