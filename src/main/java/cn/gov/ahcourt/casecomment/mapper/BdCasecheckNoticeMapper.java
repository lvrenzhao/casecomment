package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasecheckNotice;
import java.util.List;

public interface BdCasecheckNoticeMapper {
    int deleteByPrimaryKey(String ajpcggid);

    int insert(BdCasecheckNotice record);

    BdCasecheckNotice selectByPrimaryKey(String ajpcggid);

    List<BdCasecheckNotice> selectAll();

    int updateByPrimaryKey(BdCasecheckNotice record);
}