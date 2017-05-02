package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasechosenNotice;
import java.util.List;

public interface BdCasechosenNoticeMapper {
    int deleteByPrimaryKey(String sjpxggid);

    int insert(BdCasechosenNotice record);

    BdCasechosenNotice selectByPrimaryKey(String sjpxggid);

    List<BdCasechosenNotice> selectAll();

    int updateByPrimaryKey(BdCasechosenNotice record);
}