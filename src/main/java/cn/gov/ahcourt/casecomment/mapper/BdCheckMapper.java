package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCheck;
import java.util.List;

public interface BdCheckMapper {
    int deleteByPrimaryKey(String checkid);

    int insert(BdCheck record);

    BdCheck selectByPrimaryKey(String checkid);

    List<BdCheck> selectAll(BdCheck bean);

    int updateByPrimaryKey(BdCheck record);
}