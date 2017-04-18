package cn.gov.ahcourt.casecomment.bean;


public class OrganizationBean extends BaseEntity {
	private String zzjgid;

	private String zzjgmc;

	private String sjzzjgid;

	private String create_by;

	private String create_date;

	private String update_by;

	private String update_date;
	
	private String open;

	private String remarks;

	private String flag;
	
	private String id;
	
	private String name;
	
	private String pId;
	
	private String sfyzdw;
	
	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}
	
	public String getSfyzdw() {
		return sfyzdw;
	}

	public void setSfyzdw(String sfyzdw) {
		this.sfyzdw = sfyzdw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getZzjgid() {
		return zzjgid;
	}

	public void setZzjgid(String zzjgid) {
		this.zzjgid = zzjgid;
	}

	public String getZzjgmc() {
		return zzjgmc;
	}

	public void setZzjgmc(String zzjgmc) {
		this.zzjgmc = zzjgmc;
	}

	public String getSjzzjgid() {
		return sjzzjgid;
	}

	public void setSjzzjgid(String sjzzjgid) {
		this.sjzzjgid = sjzzjgid;
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
