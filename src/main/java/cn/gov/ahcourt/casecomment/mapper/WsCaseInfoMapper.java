package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.WsCaseInfo;
import java.util.List;

public interface WsCaseInfoMapper {
    int deleteByPrimaryKey(String wsid);

    int insert(WsCaseInfo record);

    WsCaseInfo selectByPrimaryKey(String wsid);

    List<WsCaseInfo> selectAll();

    int updateByPrimaryKey(WsCaseInfo record);
}