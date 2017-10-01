package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdChosenPros;
import java.util.List;

public interface BdChosenProsMapper {
    int deleteByPrimaryKey(String cpid);

    int insert(BdChosenPros record);

    BdChosenPros selectByPrimaryKey(String cpid);

    List<BdChosenPros> selectAll(BdChosenPros bean);

    int updateByPrimaryKey(BdChosenPros record);
}