package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasechosenPf;
import java.util.List;

public interface BdCasechosenPfMapper {
    int deleteByPrimaryKey(String pfid);

    int insert(BdCasechosenPf record);

    BdCasechosenPf selectByPrimaryKey(String pfid);

    List<BdCasechosenPf> selectAll();

    int updateByPrimaryKey(BdCasechosenPf record);
}