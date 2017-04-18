package cn.gov.ahcourt.casecomment.utils;

public enum FlowTypes {

	成果审核("lc001");

	private String code;

	private FlowTypes(String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}
	
}
