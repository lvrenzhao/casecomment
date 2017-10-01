package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdMiddleFile;
import java.util.List;

public interface BdMiddleFileMapper {
    int deleteByPrimaryKey(String fileid);

    int insert(BdMiddleFile record);

    BdMiddleFile selectByPrimaryKey(String fileid);

    List<BdMiddleFile> selectAll();

    int updateByPrimaryKey(BdMiddleFile record);
}