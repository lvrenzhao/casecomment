package cn.gov.ahcourt.casecomment.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.net.ftp.FTPFile;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.apache.tools.zip.ZipOutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.gov.ahcourt.casecomment.bean.FileBean;

/**
 * 文件操作工具类 实现文件的保存、输出、创建、删除、复制、压缩、解压以及目录的创建、删除、复制、压缩解压等功能
 * 
 */
public class FileUtils extends org.apache.commons.io.FileUtils {

	private static Logger log = LoggerFactory.getLogger(FileUtils.class);
	public static final String SAVEPATH = "D:\\upload";

	public static String getLocalUrl(HttpServletRequest request) {
		return request.getScheme() + "://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath();
	}

	/**
	 * 文件上传
	 * 
	 * @param fis
	 * @param fileb
	 * @return
	 * @throws IOException
	 */
	public static boolean saveFile(InputStream fis, FileBean fileb) throws IOException {
		FtpUtils ftp = new FtpUtils();
		if (ftp.saveFile(fis, fileb.getDirectory(), fileb.getSave_name())) {
			log.debug("上传成功，filename:" + fileb.getFile_name());
			return true;
		}
		ftp.logout();
		return false;
	}

	/**
	 * 文件上传
	 * 
	 * @param fis
	 * @param fileb
	 * @return
	 * @throws IOException
	 */
	public static boolean saveFile(InputStream fis, FileBean fileb, String workroot) throws IOException {
		FtpUtils ftp = new FtpUtils();
		if (ftp.saveFile(fis, fileb.getDirectory(), fileb.getSave_name(), workroot)) {
			log.debug("上传成功，filename:" + fileb.getFile_name());
			return true;
		}
		ftp.logout();
		return false;
	}

	/**
	 * 文件下载
	 *
	 * @param response
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	public static void downloadFile(HttpServletResponse response, FileBean filebean, String workroot) throws IOException {
		FtpUtils ftp = new FtpUtils();
		if (!StringUtils.isBlank(workroot)) {
			ftp.setWorkroot(workroot);
		}
		FTPFile ffile = ftp.getFtpFile(filebean.getDirectory(), filebean.getSave_name());
		if (ffile != null) {
			long fileLength = ffile.getSize();
			response.setContentType(MimeUtils.getContentType(ffile.getName()));
			response.setHeader("Content-disposition", "attachment; filename=" + new String(filebean.getFile_name().replace(" ", "").getBytes("utf-8"), "ISO8859-1"));
			response.setHeader("Content-Length", String.valueOf(fileLength));
			ftp.writeFile(filebean, response.getOutputStream());
		} else {
			log.debug("文件 " + filebean.getFile_name() + "不存在!");
		}
		ftp.logout();
	}

	/**
	 * 文件下载
	 * 
	 * @param response
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	public static void downloadFile(HttpServletResponse response, FileBean filebean) throws IOException {
		downloadFile(response, filebean, null);
	}

	/**
	 * 批量文件下载
	 * 
	 * @param response
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	public static void downloadFiles(HttpServletResponse response, List<FileBean> filelist, String zipname, String workroot) throws IOException {
		FtpUtils ftp = new FtpUtils();
		if (!StringUtils.isBlank(workroot)) {
			ftp.setWorkroot(workroot);
		}
		response.setHeader("Pragma", "No-Cache");
		response.setHeader("Cache-Control", "must-revalidate, no-transform");
		response.setContentType("application/x-zip-compressed");
		response.setHeader("Content-disposition", "attachment; filename=" + new String((zipname + ".zip").getBytes("utf-8"), "ISO8859-1"));
		ZipOutputStream zouts = new ZipOutputStream(response.getOutputStream());
		// zouts.setEncoding("utf-8");
		long filesize = 0;
		parseEntryName(filelist);
		for (FileBean filebean : filelist) {
			filesize += zipFilesToZipFile(filebean, zouts, ftp);
		}
		ftp.logout();
		response.setHeader("Content-Length", String.valueOf(filesize));
		if (zouts != null) {
			zouts.close();
		}
	}

	/**
	 * 批量文件下载
	 * 
	 * @param response
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	public static void downloadFiles(HttpServletResponse response, List<FileBean> filelist, String zipname) throws IOException {
		downloadFiles(response, filelist, zipname, null);
	}

	/**
	 * 获取文件类型
	 * 
	 * @param name
	 * @return
	 */
	public static String getFileType(String name) {
		if (name != null && name.length() != 0 && name.indexOf(".") != -1) {
			return name.substring(name.lastIndexOf(".") + 1);
		}
		return null;
	}

	/**
	 * 重命名随机文件名
	 * 
	 * @param filename
	 * @return
	 */
	public static String getFileRandName(String filename) {
		if (filename == null || filename.length() == 0) {
			return null;
		} else if (filename.indexOf(".") == -1) {
			return filename + "-" + IdGen.uuid();
		} else {
			return filename.substring(0, filename.indexOf(".")) + "-" + IdGen.uuid() + filename.substring(filename.lastIndexOf("."));
		}
	}

	/**
	 * 复制单个文件，如果目标文件存在，则不覆盖
	 * 
	 * @param srcFileName
	 *            待复制的文件名
	 * @param descFileName
	 *            目标文件名
	 * @return 如果复制成功，则返回true，否则返回false
	 */
	public static boolean copyFile(String srcFileName, String descFileName) {
		return FileUtils.copyFileCover(srcFileName, descFileName, false);
	}

	/**
	 * 复制单个文件
	 * 
	 * @param srcFileName
	 *            待复制的文件名
	 * @param descFileName
	 *            目标文件名
	 * @param coverlay
	 *            如果目标文件已存在，是否覆盖
	 * @return 如果复制成功，则返回true，否则返回false
	 */
	public static boolean copyFileCover(String srcFileName, String descFileName, boolean coverlay) {
		File srcFile = new File(srcFileName);
		// 判断源文件是否存在
		if (!srcFile.exists()) {
			log.debug("复制文件失败，源文件 " + srcFileName + " 不存在!");
			return false;
		}
		// 判断源文件是否是合法的文件
		else if (!srcFile.isFile()) {
			log.debug("复制文件失败，" + srcFileName + " 不是一个文件!");
			return false;
		}
		File descFile = new File(descFileName);
		// 判断目标文件是否存在
		if (descFile.exists()) {
			// 如果目标文件存在，并且允许覆盖
			if (coverlay) {
				log.debug("目标文件已存在，准备删除!");
				if (!FileUtils.delFile(descFileName)) {
					log.debug("删除目标文件 " + descFileName + " 失败!");
					return false;
				}
			} else {
				log.debug("复制文件失败，目标文件 " + descFileName + " 已存在!");
				return false;
			}
		} else {
			if (!descFile.getParentFile().exists()) {
				// 如果目标文件所在的目录不存在，则创建目录
				log.debug("目标文件所在的目录不存在，创建目录!");
				// 创建目标文件所在的目录
				if (!descFile.getParentFile().mkdirs()) {
					log.debug("创建目标文件所在的目录失败!");
					return false;
				}
			}
		}

		// 准备复制文件
		// 读取的位数
		int readByte = 0;
		InputStream ins = null;
		OutputStream outs = null;
		try {
			// 打开源文件
			ins = new FileInputStream(srcFile);
			// 打开目标文件的输出流
			outs = new FileOutputStream(descFile);
			byte[] buf = new byte[1024];
			// 一次读取1024个字节，当readByte为-1时表示文件已经读取完毕
			while ((readByte = ins.read(buf)) != -1) {
				// 将读取的字节流写入到输出流
				outs.write(buf, 0, readByte);
			}
			log.debug("复制单个文件 " + srcFileName + " 到" + descFileName + "成功!");
			return true;
		} catch (Exception e) {
			log.debug("复制文件失败：" + e.getMessage());
			return false;
		} finally {
			// 关闭输入输出流，首先关闭输出流，然后再关闭输入流
			if (outs != null) {
				try {
					outs.close();
				} catch (IOException oute) {
					oute.printStackTrace();
				}
			}
			if (ins != null) {
				try {
					ins.close();
				} catch (IOException ine) {
					ine.printStackTrace();
				}
			}
		}
	}

	/**
	 * 复制整个目录的内容，如果目标目录存在，则不覆盖
	 * 
	 * @param srcDirName
	 *            源目录名
	 * @param descDirName
	 *            目标目录名
	 * @return 如果复制成功返回true，否则返回false
	 */
	public static boolean copyDirectory(String srcDirName, String descDirName) {
		return FileUtils.copyDirectoryCover(srcDirName, descDirName, false);
	}

	/**
	 * 复制整个目录的内容
	 * 
	 * @param srcDirName
	 *            源目录名
	 * @param descDirName
	 *            目标目录名
	 * @param coverlay
	 *            如果目标目录存在，是否覆盖
	 * @return 如果复制成功返回true，否则返回false
	 */
	public static boolean copyDirectoryCover(String srcDirName, String descDirName, boolean coverlay) {
		File srcDir = new File(srcDirName);
		// 判断源目录是否存在
		if (!srcDir.exists()) {
			log.debug("复制目录失败，源目录 " + srcDirName + " 不存在!");
			return false;
		}
		// 判断源目录是否是目录
		else if (!srcDir.isDirectory()) {
			log.debug("复制目录失败，" + srcDirName + " 不是一个目录!");
			return false;
		}
		// 如果目标文件夹名不以文件分隔符结尾，自动添加文件分隔符
		String descDirNames = descDirName;
		if (!descDirNames.endsWith(File.separator)) {
			descDirNames = descDirNames + File.separator;
		}
		File descDir = new File(descDirNames);
		// 如果目标文件夹存在
		if (descDir.exists()) {
			if (coverlay) {
				// 允许覆盖目标目录
				log.debug("目标目录已存在，准备删除!");
				if (!FileUtils.delFile(descDirNames)) {
					log.debug("删除目录 " + descDirNames + " 失败!");
					return false;
				}
			} else {
				log.debug("目标目录复制失败，目标目录 " + descDirNames + " 已存在!");
				return false;
			}
		} else {
			// 创建目标目录
			log.debug("目标目录不存在，准备创建!");
			if (!descDir.mkdirs()) {
				log.debug("创建目标目录失败!");
				return false;
			}

		}

		boolean flag = true;
		// 列出源目录下的所有文件名和子目录名
		File[] files = srcDir.listFiles();
		for (int i = 0; i < files.length; i++) {
			// 如果是一个单个文件，则直接复制
			if (files[i].isFile()) {
				flag = FileUtils.copyFile(files[i].getAbsolutePath(), descDirName + files[i].getName());
				// 如果拷贝文件失败，则退出循环
				if (!flag) {
					break;
				}
			}
			// 如果是子目录，则继续复制目录
			if (files[i].isDirectory()) {
				flag = FileUtils.copyDirectory(files[i].getAbsolutePath(), descDirName + files[i].getName());
				// 如果拷贝目录失败，则退出循环
				if (!flag) {
					break;
				}
			}
		}

		if (!flag) {
			log.debug("复制目录 " + srcDirName + " 到 " + descDirName + " 失败!");
			return false;
		}
		log.debug("复制目录 " + srcDirName + " 到 " + descDirName + " 成功!");
		return true;

	}

	/**
	 * 
	 * 删除文件，可以删除单个文件或文件夹
	 * 
	 * @param fileName
	 *            被删除的文件名
	 * @return 如果删除成功，则返回true，否是返回false
	 */
	public static boolean delFile(String fileName) {
		return delFile(new File(fileName));
	}

	/**
	 * 
	 * 删除文件，可以删除单个文件或文件夹
	 * 
	 * @param fileName
	 *            被删除的文件名
	 * @return 如果删除成功，则返回true，否是返回false
	 */
	public static boolean delFile(File file) {
		if (!file.exists()) {
			log.debug(file.getName() + " 文件不存在!");
			return true;
		} else {
			if (file.isFile()) {
				return FileUtils.deleteFile(file);
			} else {
				return FileUtils.deleteDirectory(file.getAbsolutePath());
			}
		}
	}

	/**
	 * 
	 * 删除单个文件
	 * 
	 * @param fileName
	 *            被删除的文件名
	 * @return 如果删除成功，则返回true，否则返回false
	 */
	public static boolean deleteFile(File file) {
		if (file.exists() && file.isFile()) {
			if (file.delete()) {
				log.debug("删除文件 " + file.getAbsolutePath() + " 成功!");
				return true;
			} else {
				log.debug("删除文件 " + file.getAbsolutePath() + " 失败!");
				return false;
			}
		} else {
			log.debug(file.getName() + " 文件不存在!");
			return true;
		}
	}

	/**
	 * 
	 * 删除目录及目录下的文件
	 * 
	 * @param dirName
	 *            被删除的目录所在的文件路径
	 * @return 如果目录删除成功，则返回true，否则返回false
	 */
	public static boolean deleteDirectory(String dirName) {
		File dirFile = new File(dirName);
		if (!dirFile.exists() || !dirFile.isDirectory()) {
			log.debug(dirFile.getAbsolutePath() + " 目录不存在!");
			return true;
		}
		boolean flag = true;
		// 列出全部文件及子目录
		File[] files = dirFile.listFiles();
		for (int i = 0; i < files.length; i++) {
			// 删除子文件
			if (files[i].isFile()) {
				flag = FileUtils.deleteFile(files[i]);
				// 如果删除文件失败，则退出循环
				if (!flag) {
					break;
				}
			}
			// 删除子目录
			else if (files[i].isDirectory()) {
				flag = FileUtils.deleteDirectory(files[i].getAbsolutePath());
				// 如果删除子目录失败，则退出循环
				if (!flag) {
					break;
				}
			}
		}

		if (!flag) {
			log.debug("删除目录失败!");
			return false;
		}
		// 删除当前目录
		if (dirFile.delete()) {
			log.debug("删除目录 " + dirFile.getAbsolutePath() + " 成功!");
			return true;
		} else {
			log.debug("删除目录 " + dirFile.getAbsolutePath() + " 失败!");
			return false;
		}
	}

	/**
	 * 创建单个文件
	 * 
	 * @param descFileName
	 *            文件名，包含路径
	 * @return 如果创建成功，则返回true，否则返回false
	 */
	public static boolean createFile(String descFileName) {
		File file = new File(descFileName);
		if (file.exists()) {
			log.debug("文件 " + descFileName + " 已存在!");
			return false;
		}
		if (descFileName.endsWith(File.separator)) {
			log.debug(descFileName + " 为目录，不能创建目录!");
			return false;
		}
		if (!file.getParentFile().exists()) {
			// 如果文件所在的目录不存在，则创建目录
			if (!file.getParentFile().mkdirs()) {
				log.debug("创建文件所在的目录失败!");
				return false;
			}
		}

		// 创建文件
		try {
			if (file.createNewFile()) {
				log.debug(descFileName + " 文件创建成功!");
				return true;
			} else {
				log.debug(descFileName + " 文件创建失败!");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(descFileName + " 文件创建失败!");
			return false;
		}

	}

	/**
	 * 创建目录
	 * 
	 * @param descDirName
	 *            目录名,包含路径
	 * @return 如果创建成功，则返回true，否则返回false
	 */
	public static boolean createDirectory(String descDirName) {
		String descDirNames = descDirName;
		if (!descDirNames.endsWith(File.separator)) {
			descDirNames = descDirNames + File.separator;
		}
		File descDir = new File(descDirNames);
		if (descDir.exists()) {
			log.debug("目录 " + descDirNames + " 已存在!");
			return false;
		}
		// 创建目录
		if (descDir.mkdirs()) {
			log.debug("目录 " + descDirNames + " 创建成功!");
			return true;
		} else {
			log.debug("目录 " + descDirNames + " 创建失败!");
			return false;
		}

	}

	/**
	 * 写入文件
	 * 
	 * @param file
	 *            要写入的文件
	 */
	public static void writeToFile(String fileName, String content, boolean append) {
		try {
			FileUtils.write(new File(fileName), content, "utf-8", append);
			log.debug("文件 " + fileName + " 写入成功!");
		} catch (IOException e) {
			log.debug("文件 " + fileName + " 写入失败! " + e.getMessage());
		}
	}

	/**
	 * 写入文件
	 * 
	 * @param file
	 *            要写入的文件
	 */
	public static void writeToFile(String fileName, String content, String encoding, boolean append) {
		try {
			FileUtils.write(new File(fileName), content, encoding, append);
			log.debug("文件 " + fileName + " 写入成功!");
		} catch (IOException e) {
			log.debug("文件 " + fileName + " 写入失败! " + e.getMessage());
		}
	}

	/**
	 * 解压缩ZIP文件，将ZIP文件里的内容解压到descFileName目录下
	 * 
	 * @param zipFileName
	 *            需要解压的ZIP文件
	 * @param descFileName
	 *            目标文件
	 */
	public static boolean unZipFiles(String zipFileName, String descFileName) {
		String descFileNames = descFileName;
		if (!descFileNames.endsWith(File.separator)) {
			descFileNames = descFileNames + File.separator;
		}
		try {
			// 根据ZIP文件创建ZipFile对象
			ZipFile zipFile = new ZipFile(zipFileName);
			ZipEntry entry = null;
			String entryName = null;
			String descFileDir = null;
			byte[] buf = new byte[4096];
			int readByte = 0;
			// 获取ZIP文件里所有的entry
			@SuppressWarnings("rawtypes")
			Enumeration enums = zipFile.getEntries();
			// 遍历所有entry
			while (enums.hasMoreElements()) {
				entry = (ZipEntry) enums.nextElement();
				// 获得entry的名字
				entryName = entry.getName();
				descFileDir = descFileNames + entryName;
				if (entry.isDirectory()) {
					// 如果entry是一个目录，则创建目录
					new File(descFileDir).mkdirs();
					continue;
				} else {
					// 如果entry是一个文件，则创建父目录
					new File(descFileDir).getParentFile().mkdirs();
				}
				File file = new File(descFileDir);
				// 打开文件输出流
				OutputStream os = new FileOutputStream(file);
				// 从ZipFile对象中打开entry的输入流
				InputStream is = zipFile.getInputStream(entry);
				while ((readByte = is.read(buf)) != -1) {
					os.write(buf, 0, readByte);
				}
				os.close();
				is.close();
			}
			zipFile.close();
			log.debug("文件解压成功!");
			return true;
		} catch (Exception e) {
			log.debug("文件解压失败：" + e.getMessage());
			return false;
		}
	}

	/**
	 * 将文件压缩到ZIP输出流
	 * 
	 * @param dirPath
	 *            目录路径
	 * @param file
	 *            文件
	 * @param zouts
	 *            输出流
	 */
	public static long zipFilesToZipFile(FileBean filebean, ZipOutputStream zouts, FtpUtils ftp) {
		long iosize = 0;
		FTPFile file = ftp.getFtpFile(filebean.getDirectory(), filebean.getSave_name());
		ZipEntry entry = null;
		if (file != null && file.isFile()) {
			try {
				System.out.println(filebean.getEntryname());
				// 创建一个ZipEntry
				entry = new ZipEntry(filebean.getEntryname());
				// 存储信息到压缩文件
				zouts.putNextEntry(entry);
				ftp.writeFile(filebean, zouts);
				zouts.closeEntry();
				log.debug("添加文件 " + file.getName() + " 到zip文件中!");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return iosize;
	}

	/**
	 * 修复路径，将 \\ 或 / 等替换为 File.separator
	 * 
	 * @param path
	 * @return
	 */
	public static String path(String path) {
		String p = StringUtils.replace(path, "\\", "/");
		p = StringUtils.join(StringUtils.split(p, "/"), "/");
		if (!StringUtils.startsWithAny(p, "/") && StringUtils.startsWithAny(path, "\\", "/")) {
			p += "/";
		}
		if (!StringUtils.endsWithAny(p, "/") && StringUtils.endsWithAny(path, "\\", "/")) {
			p = p + "/";
		}
		if (path != null && path.startsWith("/")) {
			p = "/" + p; // linux下路径
		}
		return p;
	}

	private static void parseEntryName(List<FileBean> filelist) {
		List<String> entrynames = new ArrayList<String>();
		if (filelist != null) {
			for (FileBean fileb : filelist) {
				String entryname = StringUtils.isBlank(fileb.getEntrydic()) ? "" : (fileb.getEntrydic() + "/") + fileb.getFile_name();
				fileb.setEntryname(parseOnlyName(entrynames, entryname));
				entrynames.add(fileb.getEntryname());
			}
		}
	}

	/**
	 * 获取唯一文件名，重名后补(num)
	 * 
	 * @param entrynames
	 * @param entryname
	 */
	private static String parseOnlyName(List<String> entrynames, String entryname) {
		if (entrynames == null || StringUtils.isEmpty(entryname)) {
			return null;
		}
		for (String entry : entrynames) {
			if (entryname.equals(entry)) {
				String newentry = entryname;
				Pattern pattern = Pattern.compile("\\(\\d+\\)(\\.\\w+)?$");
				Matcher matcher = pattern.matcher(entryname);
				if (matcher.find()) {
					Integer num = Integer.parseInt(entryname.substring(entryname.lastIndexOf("(") + 1, entryname.lastIndexOf(")")));
					newentry = matcher.replaceAll("(" + (num + 1) + entryname.substring(entryname.lastIndexOf(")")));
				} else {
					if (entryname.lastIndexOf(".") != -1) {
						newentry = entryname.substring(0, entryname.lastIndexOf(".")) + "(1)" + entryname.substring(entryname.lastIndexOf("."));
					} else {
						newentry = entryname + "(1)";
					}
				}
				System.out.println(newentry);
				return parseOnlyName(entrynames, newentry);
			}
		}
		return entryname;
	}

}
