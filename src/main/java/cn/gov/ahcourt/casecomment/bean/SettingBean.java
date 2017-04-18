package cn.gov.ahcourt.casecomment.bean;


public class SettingBean extends BaseEntity {
	private static final long serialVersionUID = 4217826654108667906L;

	private String szid;

	private String setkey;

	private String setvalue;

	private String ms;

	private String create_by;

	private String create_date;

	private String update_by;

	private String update_date;

	private String remarks;

	private String flag;

	public String getSzid() {
		return szid;
	}

	public void setSzid(String szid) {
		this.szid = szid;
	}

	public String getSetkey() {
		return setkey;
	}

	public void setSetkey(String setkey) {
		this.setkey = setkey;
	}

	public String getSetvalue() {
		return setvalue;
	}

	public void setSetvalue(String setvalue) {
		this.setvalue = setvalue;
	}

	public String getMs() {
		return ms;
	}

	public void setMs(String ms) {
		this.ms = ms;
	}

	public String getCreate_by() {
		return create_by;
	}

	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public String getUpdate_by() {
		return update_by;
	}

	public void setUpdate_by(String update_by) {
		this.update_by = update_by;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
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
