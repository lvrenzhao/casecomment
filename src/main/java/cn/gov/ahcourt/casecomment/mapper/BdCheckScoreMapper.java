package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCheckScore;
import java.util.List;

public interface BdCheckScoreMapper {
    int deleteByPrimaryKey(String scoreid);
    int deleteByCrid(String crid);

    int insert(BdCheckScore record);

    BdCheckScore selectByPrimaryKey(String scoreid);

    List<BdCheckScore> selectAll(BdCheckScore bean);

    int updateByPrimaryKey(BdCheckScore record);
}