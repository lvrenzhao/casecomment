package cn.gov.ahcourt.casecomment.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.gov.ahcourt.casecomment.bean.FileBean;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.FileInfoMapper;
import cn.gov.ahcourt.casecomment.utils.FileUtils;
import cn.gov.ahcourt.casecomment.utils.FtpUtils;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.MD5Utils;
import cn.gov.ahcourt.casecomment.utils.StreamUtils;
import cn.gov.ahcourt.casecomment.utils.TimeUtils;

@Service
public class FileService {

	@Resource
	private FileInfoMapper fileInfoMapper;

	public Map<String, Object> addFile(MultipartFile file, UserBean user) {
		Map<String, Object> message = new HashMap<String, Object>();
		try {
			String md5str = new MD5Utils().getMD5String(file.getInputStream());

			FileBean fileb = fileInfoMapper.selectByMD5(md5str);
			if (fileb == null) {
				fileb = new FileBean();
				fileb.setDirectory(TimeUtils.formatDate());
				fileb.setSave_name(FileUtils.getFileRandName(file.getOriginalFilename()));
			}
			fileb.setFile_name(file.getOriginalFilename());
			fileb.setFile_type(FileUtils.getFileType(file.getOriginalFilename()));
			fileb.setFile_size(file.getSize());
			fileb.setMd5(md5str);
			fileb.setKeywords(file.getOriginalFilename());
			fileb.setId(IdGen.uuid());
			fileb.setIs_pub("1");
			fileb.setDownload_count(0);
			fileb.setUser_id(user.getYhid());
			fileb.setCreate_by(user.getYhid());
			fileb.setUpdate_by(user.getYhid());

			if (FileUtils.saveFile(file.getInputStream(), fileb)) {
				return insert(fileb);
			} else {
				message.put("code", -1);
				message.put("code", "上传失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return message;
	}

	public Map<String, Object> addFile(byte[] filebyte, String filename) {
		Map<String, Object> message = new HashMap<String, Object>();
		if (filebyte == null || filebyte.length == 0) {
			message.put("code", -1);
			message.put("code", "上传失败");
			return message;
		}
		try {
			String md5str = new MD5Utils().getMD5String(filebyte);

			FileBean fileb = new FileBean();
			fileb.setFile_name(filename);
			fileb.setFile_type(FileUtils.getFileType(filename));
			fileb.setDirectory(TimeUtils.formatDate());
			fileb.setSave_name(FileUtils.getFileRandName(filename));
			fileb.setFile_size((long) filebyte.length);
			fileb.setMd5(md5str);
			fileb.setKeywords(filename);
			fileb.setId(IdGen.uuid());
			fileb.setIs_pub("1");
			fileb.setUser_id("0");

			if (FileUtils.saveFile(StreamUtils.byteTOInputStream(filebyte), fileb)) {
				return insert(fileb);
			} else {
				message.put("code", -1);
				message.put("code", "上传失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return message;
	}

	public ModelAndView download(String fileid, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		FileBean file = fileInfoMapper.selectByPrimaryKey(fileid);
		if (file != null && file.getDel_flag().equals("0")) {
			try {
				FileBean record = new FileBean();
				record.setId(fileid);
				fileInfoMapper.updateDownloadCount(record);
				FileUtils.downloadFile(response, file, null);
			} catch (IOException e) {
				e.printStackTrace();
				model.addAttribute("msg", "下载文件失败");
				return new ModelAndView("../exception", model);
			}
		} else {
			model.addAttribute("msg", "文件失效");
			return new ModelAndView("../exception", model);
		}
		return null;
	}

	public ModelAndView downloadzip(List<FileBean> filelist, HttpServletResponse response, String zipname) {
		if (filelist != null && filelist.size() > 0) {
			try {

				FileUtils.downloadFiles(response, filelist, zipname, "");
				// FileUtils.downloadFiles(response, filelist, zipname, null);

			} catch (IOException e) {
				e.printStackTrace();
				ModelMap model = new ModelMap();
				model.addAttribute("msg", "下载文件失败");
				return new ModelAndView("../exception", model);
			}
		}
		return null;
	}

	public Map<String, Object> insert(FileBean info) {
		Map<String, Object> message = new HashMap<String, Object>();
		message.put("code", 1);
		message.put("msg", "上传成功！");
		message.put("id", info.getId());
		message.put("filename", info.getFile_name());
		message.put("filetype", info.getFile_type());
		message.put("md5", info.getMd5());
		if (fileInfoMapper.insertSelective(info) <= 0) {
			message.put("code", -1);
			message.put("msg", "文件插入失败！");
		}
		return message;
	}

	public InputStream getFileInputStream(FtpUtils ftp, String id) {
		FileBean fileb = fileInfoMapper.selectByPrimaryKey(id);
		return ftp.getFileInputStream(fileb.getDirectory(), fileb.getSave_name());
	}

	public int insertSelective(FileBean record) {
		return fileInfoMapper.insertSelective(record);
	}

	public FileBean selectByPrimaryKey(String id) {
		return fileInfoMapper.selectByPrimaryKey(id);
	}

	public List<String> selectTypes() {
		return fileInfoMapper.selectTypes();
	}

	public List<FileBean> select(FileBean record) {
		return fileInfoMapper.select(record);
	}

	public int updateDownloadCount(FileBean record) {
		return fileInfoMapper.updateDownloadCount(record);
	}

	public int updateByPrimaryKeySelective(FileBean record) {
		return fileInfoMapper.updateByPrimaryKeySelective(record);
	}

	public int deleteFile(String id) {
		FileBean record = new FileBean();
		record.setId(id);
		record.setDel_flag("1");
		return fileInfoMapper.updateByPrimaryKeySelective(record);
	}

	public List<FileBean> download(List<String> id) {
		return fileInfoMapper.download(id);
	}
}
