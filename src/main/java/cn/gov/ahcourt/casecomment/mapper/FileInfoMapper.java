package cn.gov.ahcourt.casecomment.mapper;

import java.util.List;

import cn.gov.ahcourt.casecomment.bean.FileBean;

public interface FileInfoMapper {
	int insert(FileBean record);

	int insertSelective(FileBean record);

	FileBean selectByPrimaryKey(String id);

	List<String> selectTypes();

	List<FileBean> select(FileBean record);

	int updateDownloadCount(FileBean record);

	int updateByPrimaryKeySelective(FileBean record);
	
	List<FileBean> download(List<String> id);

	FileBean selectByMD5(String md5);
}