package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdChosenScore;
import java.util.List;

public interface BdChosenScoreMapper {
    int deleteByPrimaryKey(String scoreid);

    int insert(BdChosenScore record);

    BdChosenScore selectByPrimaryKey(String scoreid);

    List<BdChosenScore> selectAll(BdChosenScore bean);

    int updateByPrimaryKey(BdChosenScore record);
}