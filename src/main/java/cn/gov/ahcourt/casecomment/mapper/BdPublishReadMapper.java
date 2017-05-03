package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdPublishRead;
import java.util.List;

public interface BdPublishReadMapper {
    int deleteByPrimaryKey(String xxggydid);

    int insert(BdPublishRead record);

    BdPublishRead selectByPrimaryKey(String xxggydid);

    List<BdPublishRead> selectAll();
    List<BdPublishRead> select(BdPublishRead bean);

    int updateByPrimaryKey(BdPublishRead record);
}