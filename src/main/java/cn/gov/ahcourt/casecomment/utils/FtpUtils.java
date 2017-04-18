package cn.gov.ahcourt.casecomment.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.gov.ahcourt.casecomment.bean.FileBean;

public class FtpUtils {
	private static Logger log = LoggerFactory.getLogger(FtpUtils.class);

	private String ftpurl;
	private String ftpuser;
	private String ftppwd;
	private String workroot;

	private FTPClient ftpClient = null;

	public FtpUtils() {
		init();
		this.ftpClient = new FTPClient();
		this.ftpClient.setControlEncoding("GBK");
	}

	private void init() {
		this.ftpurl = PropertiesUtils.getProperty("ftpurl");
		this.ftpuser = PropertiesUtils.getProperty("ftpuser");
		this.ftppwd = PropertiesUtils.getProperty("ftppwd");
		this.workroot = PropertiesUtils.getProperty("workroot");
	}

	private boolean connect() {
		if (!ftpClient.isConnected()) {
			try {
				ftpClient.connect(ftpurl);
				ftpClient.login(ftpuser, ftppwd);
				if (FTPReply.isPositiveCompletion(ftpClient.getReplyCode())) {
					log.debug("FTP连接成功。");
					return true;
				} else {
					log.debug("未连接到FTP，用户名或密码错误。");
					disconnect();
				}
			} catch (IOException e) {
				e.printStackTrace();
				log.debug("FTP地址可能错误，请正确配置。");
			}
		}
		return false;
	}

	private void disconnect() {
		if (ftpClient.isConnected()) {
			try {
				ftpClient.disconnect();
			} catch (IOException ioe) {
			}
		}
	}

	public void logout() {
		if (ftpClient != null) {
			try {
				disconnect();
				ftpClient.logout();
			} catch (IOException ioe) {
			}
		}
	}

	public boolean saveFile(InputStream is, String directory, String savename) {
		return saveFile(is, directory, savename, workroot);
	}

	public boolean saveFile(InputStream is, String directory, String savename, String workroot) {
		if (ftpClient.isConnected() || connect()) {


			try {
				String roowdir = "/";
				if (!StringUtils.isBlank(workroot)) {
					//ftpClient.makeDirectory(workroot);
					roowdir = workroot + "/";
				}
				if (!StringUtils.isBlank(directory)) {
					roowdir += directory;
				}
//				ftpClient.makeDirectory(roowdir);
//				ftpClient.changeWorkingDirectory(roowdir);
				createDirs(roowdir);
				// 设置文件类型（二进制）
				ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
				ftpClient.storeFile(savename, is);
				log.debug("上传成功！");
				return true;
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}
		} else {
			log.debug("上传失败！");
			return false;
		}
	}

	public void createDirs(String remoteUpLoadPath) throws IOException {
		String[]dirs = remoteUpLoadPath.split("/");
		for(String dir : dirs){
			if(StringUtils.isNotEmpty(dir)){
				boolean ifexist =  this.ftpClient.changeWorkingDirectory(dir);
				if(!ifexist){
					this.ftpClient.mkd(dir);
					this.ftpClient.changeWorkingDirectory(dir);
				}
			}
		}
	}


	public void writeFile(FileBean fileb, OutputStream os) {
		FTPClientConfig config = new FTPClientConfig(FTPClientConfig.SYST_UNIX);
		ftpClient.configure(config);
		if (ftpClient.isConnected() || connect()) {
//			String ftpfilepath = workroot + (StringUtils.isBlank(fileb.getDirectory()) ? "" : ("/" + fileb.getDirectory()) + "/" + fileb.getSave_name());
			try {
				// 设置文件类型（二进制）
				ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
				if (ftpClient.retrieveFile(fileb.getSave_name(), os)) {
					log.debug("写入成功");
				} else {
					log.debug("写入失败");
				}
			} catch (IOException e) {
				e.printStackTrace();
				log.debug("writeFile=================>error");
			}
		} else {
			log.debug("connect=================>error");
		}
	}

	public FTPFile getFtpFile(String directory, String save_name) {
		if (ftpClient.isConnected() || connect()) {
			try {
				String roowdir = workroot + (StringUtils.isBlank(directory) ? "" : ("/" + directory));
				//ftpClient.changeWorkingDirectory(roowdir);
				createDirs(roowdir);
				ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
				FTPFile[] filearr = ftpClient.listFiles();
				for (FTPFile ftpfile : filearr) {
					if (ftpfile.getName().equals(save_name)) {
						return ftpfile;
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
				log.debug("getFtpFile=================>error");
			}
		} else {
			log.debug("connect=================>error");
		}
		return null;
	}

	public InputStream getFileInputStream(String directory, String save_name) {
		if (ftpClient.isConnected() || connect()) {
			try {
				String roowdir = workroot + (StringUtils.isBlank(directory) ? "" : ("/" + directory));
				ftpClient.changeWorkingDirectory(roowdir);
				ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
				return ftpClient.retrieveFileStream(save_name);
			} catch (IOException e) {
				e.printStackTrace();
				log.debug("getFileInputStream=================>error");
			}
		} else {
			log.debug("connect=================>error");
		}
		return null;
	}

	public String getFtpurl() {
		return ftpurl;
	}

	public void setFtpurl(String ftpurl) {
		this.ftpurl = ftpurl;
	}

	public String getFtpuser() {
		return ftpuser;
	}

	public void setFtpuser(String ftpuser) {
		this.ftpuser = ftpuser;
	}

	public String getFtppwd() {
		return ftppwd;
	}

	public void setFtppwd(String ftppwd) {
		this.ftppwd = ftppwd;
	}

	public String getWorkroot() {
		return workroot;
	}

	public void setWorkroot(String workroot) {
		this.workroot = workroot;
	}

	public FTPClient getFtpClient() {
		return ftpClient;
	}

	public void setFtpClient(FTPClient ftpClient) {
		this.ftpClient = ftpClient;
	}

}
