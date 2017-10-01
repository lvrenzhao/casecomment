package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdChosenMsgto;
import java.util.List;

public interface BdChosenMsgtoMapper {
    int deleteByPrimaryKey(String msgtoid);

    int insert(BdChosenMsgto record);

    BdChosenMsgto selectByPrimaryKey(String msgtoid);

    List<BdChosenMsgto> selectAll();

    int updateByPrimaryKey(BdChosenMsgto record);
}