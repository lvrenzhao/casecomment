package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCheckCases;
import java.util.List;

public interface BdCheckCasesMapper {
    int deleteByPrimaryKey(String ccid);

    int insert(BdCheckCases record);

    BdCheckCases selectByPrimaryKey(String ccid);

    List<BdCheckCases> selectAll(BdCheckCases bean);
    List<BdCheckCases> selectWork(BdCheckCases bean);

    int updateByPrimaryKey(BdCheckCases record);

    List<BdCheckCases> selectTop(BdCheckCases bean);
}