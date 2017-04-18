package cn.gov.ahcourt.casecomment.bean;

public class RoleMenuBean extends BaseEntity {
	
	private String cdid;

	private String jsid;

	private String create_by;

	private String create_date;

	private String update_by;

	private String update_date;

	private String remarks;

	private String flag;

	public String getCdid() {
		return cdid;
	}

	public void setCdid(String cdid) {
		this.cdid = cdid;
	}

	public String getJsid() {
		return jsid;
	}

	public void setJsid(String jsid) {
		this.jsid = jsid;
	}

	public String getCreateBy() {
		return create_by;
	}

	public void setCreateBy(String create_by) {
		this.create_by = create_by;
	}

	public String getCreateDate() {
		return create_date;
	}

	public void setCreateDate(String create_date) {
		this.create_date = create_date;
	}

	public String getUpdateBy() {
		return update_by;
	}

	public void setUpdateBy(String update_by) {
		this.update_by = update_by;
	}

	public String getUpdateDate() {
		return update_date;
	}

	public void setUpdateDate(String update_date) {
		this.update_date = update_date;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

}
