package cn.gov.ahcourt.casecomment.bean;

public class FileBean extends BaseEntity {

	private static final long serialVersionUID = 8062222635832242104L;

	private String id;

	private String user_id;

	private String is_pub;

	private String file_name;

	private String save_name;

	private String directory;

	private String file_type;

	private Long file_size;

	private String md5;

	private String keywords;

	private Integer download_count;

	private String create_by;

	private String create_time;

	private String update_by;

	private String update_time;

	private String remark;

	private String del_flag;
	
	private String entrydic;
	
	private String entryname;

	public String getEntryname() {
		return entryname;
	}

	public void setEntryname(String entryname) {
		this.entryname = entryname;
	}

	public String getEntrydic() {
		return entrydic;
	}

	public void setEntrydic(String entrydic) {
		this.entrydic = entrydic;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getIs_pub() {
		return is_pub;
	}

	public void setIs_pub(String is_pub) {
		this.is_pub = is_pub;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getSave_name() {
		return save_name;
	}

	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}

	public String getDirectory() {
		return directory;
	}

	public void setDirectory(String directory) {
		this.directory = directory;
	}

	public String getFile_type() {
		return file_type;
	}

	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}

	public Long getFile_size() {
		return file_size;
	}

	public void setFile_size(Long file_size) {
		this.file_size = file_size;
	}

	public String getMd5() {
		return md5;
	}

	public void setMd5(String md5) {
		this.md5 = md5;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Integer getDownload_count() {
		return download_count;
	}

	public void setDownload_count(Integer download_count) {
		this.download_count = download_count;
	}

	public String getCreate_by() {
		return create_by;
	}

	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getUpdate_by() {
		return update_by;
	}

	public void setUpdate_by(String update_by) {
		this.update_by = update_by;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}
}