package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasecheckJy;
import java.util.List;

public interface BdCasecheckJyMapper {
    int deleteByPrimaryKey(String ajpcjyid);

    int insert(BdCasecheckJy record);

    BdCasecheckJy selectByPrimaryKey(String ajpcjyid);

    List<BdCasecheckJy> selectAll();

    int updateByPrimaryKey(BdCasecheckJy record);
}