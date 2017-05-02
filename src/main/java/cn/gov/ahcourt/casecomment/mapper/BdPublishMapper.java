package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdPublish;
import java.util.List;

public interface BdPublishMapper {
    int deleteByPrimaryKey(String xxid);

    int insert(BdPublish record);

    BdPublish selectByPrimaryKey(String xxid);

    List<BdPublish> selectAll();

    int updateByPrimaryKey(BdPublish record);
}