package cn.gov.ahcourt.casecomment.bean;

import java.util.List;

public class MenuBean extends BaseEntity {
	private String cdid;

	private String cdmc;

	private String sjcdid;

	private String cdurl;

	private String tb;

	private Integer px;

	private Integer ymgd;

	private Integer ymkd;

	private String bz;

	private String create_by;

	private String create_date;

	private String update_by;

	private String update_date;

	private String remarks;

	private String flag;
	
	/********以下是后台需要添加的字段**********/

	private String id;

	private String name;

	private String pId;

	private String checked;
	
	private String open;

	private String jsid;
	
	private List<MenuBean> submenus;

	public List<MenuBean> getSubmenus() {
		return submenus;
	}

	public void setSubmenus(List<MenuBean> submenus) {
		this.submenus = submenus;
	}
	

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getJsid() {
		return jsid;
	}

	public void setJsid(String jsid) {
		this.jsid = jsid;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
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

	public String getCdid() {
		return cdid;
	}

	public void setCdid(String cdid) {
		this.cdid = cdid;
	}

	public String getCdmc() {
		return cdmc;
	}

	public void setCdmc(String cdmc) {
		this.cdmc = cdmc;
	}

	public String getSjcdid() {
		return sjcdid;
	}

	public void setSjcdid(String sjcdid) {
		this.sjcdid = sjcdid;
	}

	public String getCdurl() {
		return cdurl;
	}

	public void setCdurl(String cdurl) {
		this.cdurl = cdurl;
	}

	public String getTb() {
		return tb;
	}

	public void setTb(String tb) {
		this.tb = tb;
	}

	public Integer getPx() {
		return px;
	}

	public void setPx(Integer px) {
		this.px = px;
	}

	public Integer getYmgd() {
		return ymgd;
	}

	public void setYmgd(Integer ymgd) {
		this.ymgd = ymgd;
	}

	public Integer getYmkd() {
		return ymkd;
	}

	public void setYmkd(Integer ymkd) {
		this.ymkd = ymkd;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
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
