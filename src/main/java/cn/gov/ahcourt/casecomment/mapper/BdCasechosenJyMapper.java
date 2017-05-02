package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasechosenJy;
import java.util.List;

public interface BdCasechosenJyMapper {
    int deleteByPrimaryKey(String sjpxjyid);

    int insert(BdCasechosenJy record);

    BdCasechosenJy selectByPrimaryKey(String sjpxjyid);

    List<BdCasechosenJy> selectAll();

    int updateByPrimaryKey(BdCasechosenJy record);
}