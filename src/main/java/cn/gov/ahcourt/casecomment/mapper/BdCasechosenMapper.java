package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasechosen;
import java.util.List;

public interface BdCasechosenMapper {
    int deleteByPrimaryKey(String sjpxid);

    int insert(BdCasechosen record);

    BdCasechosen selectByPrimaryKey(String sjpxid);

    List<BdCasechosen> selectAll();

    int updateByPrimaryKey(BdCasechosen record);
}