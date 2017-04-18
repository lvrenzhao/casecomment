package cn.gov.ahcourt.casecomment.bean;

import java.math.BigDecimal;

public class DictBean extends BaseEntity {
	private String zdbh;

	private String zdmc;

	private String sjzdbh;

	private Integer sort;

	private String create_by;

	private String create_date;

	private String update_by;

	private String update_date;

	private String remarks;

	private String flag;
	private String qx;
	private String yhid;
	private BigDecimal ssje;
	
	public BigDecimal getSsje() {
		return ssje;
	}

	public void setSsje(BigDecimal ssje) {
		this.ssje = ssje;
	}

	public String getYhid() {
		return yhid;
	}

	public void setYhid(String yhid) {
		this.yhid = yhid;
	}

	public String getQx() {
		return qx;
	}

	public void setQx(String qx) {
		this.qx = qx;
	}

	public String getZdbh() {
		return zdbh;
	}

	public void setZdbh(String zdbh) {
		this.zdbh = zdbh;
	}

	public String getZdmc() {
		return zdmc;
	}

	public void setZdmc(String zdmc) {
		this.zdmc = zdmc;
	}

	public String getSjzdbh() {
		return sjzdbh;
	}

	public void setSjzdbh(String sjzdbh) {
		this.sjzdbh = sjzdbh;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
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
