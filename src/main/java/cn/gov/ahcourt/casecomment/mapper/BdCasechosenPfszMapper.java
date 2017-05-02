package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasechosenPfsz;
import java.util.List;

public interface BdCasechosenPfszMapper {
    int insert(BdCasechosenPfsz record);

    List<BdCasechosenPfsz> selectAll();
}