package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdChosen;
import java.util.List;

public interface BdChosenMapper {
    int deleteByPrimaryKey(String chosenid);

    int insert(BdChosen record);

    BdChosen selectByPrimaryKey(String chosenid);

    List<BdChosen> selectAll();

    int updateByPrimaryKey(BdChosen record);
}