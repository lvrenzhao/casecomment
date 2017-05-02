package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasecheck;
import java.util.List;

public interface BdCasecheckMapper {
    int deleteByPrimaryKey(String ajpcid);

    int insert(BdCasecheck record);

    BdCasecheck selectByPrimaryKey(String ajpcid);

    List<BdCasecheck> selectAll();

    int updateByPrimaryKey(BdCasecheck record);
}