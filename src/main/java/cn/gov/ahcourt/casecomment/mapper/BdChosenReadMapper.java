package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdChosenRead;
import java.util.List;

public interface BdChosenReadMapper {
    int deleteByPrimaryKey(String readid);

    int insert(BdChosenRead record);

    BdChosenRead selectByPrimaryKey(String readid);

    List<BdChosenRead> selectAll();

    int updateByPrimaryKey(BdChosenRead record);
}