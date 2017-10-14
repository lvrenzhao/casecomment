package cn.gov.ahcourt.casecomment.mapper;

import cn.gov.ahcourt.casecomment.bean.SdProfessional;
import java.util.List;

public interface SdProfessionalMapper {
    int deleteByPrimaryKey(String zjid);

    int insert(SdProfessional record);

    SdProfessional selectByPrimaryKey(String zjid);

    List<SdProfessional> selectAll();

    List<SdProfessional> select(SdProfessional bean);
    List<SdProfessional> selectForActive(String ggid);

    List<SdProfessional> selectForChosen(String ggid);

    int updateByPrimaryKey(SdProfessional record);
}