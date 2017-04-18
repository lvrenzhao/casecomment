package cn.gov.ahcourt.casecomment.bean;

public class FlowResult {
	private boolean result;
	private String errorMsg;
	private String msg;
	private Integer type;
	private boolean sfjs;
	private FlowJobBean Job;
	
	public boolean isSfjs() {
		return sfjs;
	}

	public void setSfjs(boolean sfjs) {
		this.sfjs = sfjs;
	}

	public FlowJobBean getJob() {
		return Job;
	}

	public void setJob(FlowJobBean job) {
		Job = job;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public boolean getResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
}