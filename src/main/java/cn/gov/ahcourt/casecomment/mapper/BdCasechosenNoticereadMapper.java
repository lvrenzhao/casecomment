package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasechosenNoticeread;
import java.util.List;

public interface BdCasechosenNoticereadMapper {
    int deleteByPrimaryKey(String sjpxggydid);

    int insert(BdCasechosenNoticeread record);

    BdCasechosenNoticeread selectByPrimaryKey(String sjpxggydid);

    List<BdCasechosenNoticeread> selectAll();

    int updateByPrimaryKey(BdCasechosenNoticeread record);
}