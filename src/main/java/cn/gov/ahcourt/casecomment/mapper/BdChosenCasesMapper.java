package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCheckCases;
import cn.gov.ahcourt.casecomment.bean.BdChosenCases;
import java.util.List;

public interface BdChosenCasesMapper {
    int deleteByPrimaryKey(String ccid);

    int insert(BdChosenCases record);

    BdChosenCases selectByPrimaryKey(String ccid);

    List<BdChosenCases> selectAll(BdChosenCases bean);
    List<BdChosenCases> selectWork(BdChosenCases bean);

    int updateByPrimaryKey(BdChosenCases record);
    int setGroupNull(String groupid);
    int setGroupNullByCCID(String ccid);

    List<BdChosenCases> selectTop(BdChosenCases bean);


}