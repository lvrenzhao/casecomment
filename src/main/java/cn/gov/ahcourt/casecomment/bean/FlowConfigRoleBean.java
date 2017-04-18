package cn.gov.ahcourt.casecomment.bean;


public class FlowConfigRoleBean extends BaseEntity {
	private static final long serialVersionUID = 9064838923352242371L;

	private String id;

	private String lcpzid;

	private String lczdid;

	private String ysfs;

	private String value1;

	private String value2;

	private String create_by;

	private String create_date;

	private String update_by;

	private String update_date;

	private String remarks;

	private String flag;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLcpzid() {
		return lcpzid;
	}

	public void setLcpzid(String lcpzid) {
		this.lcpzid = lcpzid;
	}

	public String getLczdid() {
		return lczdid;
	}

	public void setLczdid(String lczdid) {
		this.lczdid = lczdid;
	}

	public String getYsfs() {
		return ysfs;
	}

	public void setYsfs(String ysfs) {
		this.ysfs = ysfs;
	}

	public String getValue1() {
		return value1;
	}

	public void setValue1(String value1) {
		this.value1 = value1;
	}

	public String getValue2() {
		return value2;
	}

	public void setValue2(String value2) {
		this.value2 = value2;
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
