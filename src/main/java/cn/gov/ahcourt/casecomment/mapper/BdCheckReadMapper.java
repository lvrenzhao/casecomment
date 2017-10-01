package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCheckRead;
import java.util.List;

public interface BdCheckReadMapper {
    int deleteByPrimaryKey(String readid);

    int insert(BdCheckRead record);

    BdCheckRead selectByPrimaryKey(String readid);

    List<BdCheckRead> selectAll();

    int updateByPrimaryKey(BdCheckRead record);
}