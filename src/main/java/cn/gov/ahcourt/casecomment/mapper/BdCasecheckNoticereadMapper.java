package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasecheckNoticeread;
import java.util.List;

public interface BdCasecheckNoticereadMapper {
    int deleteByPrimaryKey(String ajpcggydid);

    int insert(BdCasecheckNoticeread record);

    BdCasecheckNoticeread selectByPrimaryKey(String ajpcggydid);

    List<BdCasecheckNoticeread> selectAll();

    int updateByPrimaryKey(BdCasecheckNoticeread record);
}