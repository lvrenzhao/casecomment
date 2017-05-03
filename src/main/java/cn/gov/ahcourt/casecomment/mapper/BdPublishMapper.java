package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdPublish;
import java.util.List;

public interface BdPublishMapper {
    int deleteByPrimaryKey(String xxid);

    int insert(BdPublish record);

    BdPublish selectByPrimaryKey(String xxid);

    List<BdPublish> selectAll();

    List<BdPublish> selectMyList(BdPublish bean);

    List<BdPublish> selectVerifyList(BdPublish bean);

    List<BdPublish> selectVerifyHistoryList(BdPublish bean);

    List<BdPublish> selectUnwatchedList(BdPublish bean);

    List<BdPublish> selectWatchedList(BdPublish bean);



    int updateByPrimaryKey(BdPublish record);


}