package cn.gov.ahcourt.casecomment.bean;

import java.math.BigDecimal;

public class FlowConfigTxBean extends BaseEntity {
	
	private String txid;
	
	private String lcmk;
	
	private String lcbb;
	
	private String txnr;
	
	private String create_by;

	private String create_date;

	private String update_by;

	private String update_date;

	private String remarks;

	private String flag;
	
	private String steps;

	public String getSteps() {
		return steps;
	}

	public void setSteps(String steps) {
		this.steps = steps;
	}

	public String getTxid() {
		return txid;
	}

	public void setTxid(String txid) {
		this.txid = txid;
	}

	public String getLcmk() {
		return lcmk;
	}

	public void setLcmk(String lcmk) {
		this.lcmk = lcmk;
	}

	public String getLcbb() {
		return lcbb;
	}

	public void setLcbb(String lcbb) {
		this.lcbb = lcbb;
	}

	public String getTxnr() {
		return txnr;
	}

	public void setTxnr(String txnr) {
		this.txnr = txnr;
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
