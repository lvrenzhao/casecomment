package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdMiddleCase;
import java.util.List;

public interface BdMiddleCaseMapper {
    int deleteByPrimaryKey(String ajid);

    int insert(BdMiddleCase record);

    BdMiddleCase selectByPrimaryKey(String ajid);

    List<BdMiddleCase> selectAll();

    int updateByPrimaryKey(BdMiddleCase record);
}