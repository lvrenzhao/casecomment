package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.BdCasecheckZldjsz;
import java.util.List;

public interface BdCasecheckZldjszMapper {
    int deleteByPrimaryKey(String ajzldjid);

    int insert(BdCasecheckZldjsz record);

    BdCasecheckZldjsz selectByPrimaryKey(String ajzldjid);

    List<BdCasecheckZldjsz> selectAll();

    int updateByPrimaryKey(BdCasecheckZldjsz record);
}