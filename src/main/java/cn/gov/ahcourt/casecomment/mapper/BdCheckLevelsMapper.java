package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCheckLevels;
import java.util.List;

public interface BdCheckLevelsMapper {
    int deleteByPrimaryKey(String levelid);

    int insert(BdCheckLevels record);

    BdCheckLevels selectByPrimaryKey(String levelid);

    List<BdCheckLevels> selectAll(BdCheckLevels bean);

    int updateByPrimaryKey(BdCheckLevels record);

    String getLevelByScore(String score);

}