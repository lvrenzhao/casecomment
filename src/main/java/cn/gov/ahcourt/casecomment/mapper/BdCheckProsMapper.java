package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCheckPros;
import java.util.List;

public interface BdCheckProsMapper {
    int deleteByPrimaryKey(String cpid);

    int insert(BdCheckPros record);

    BdCheckPros selectByPrimaryKey(String cpid);

    List<BdCheckPros> selectAll();

    int updateByPrimaryKey(BdCheckPros record);
}