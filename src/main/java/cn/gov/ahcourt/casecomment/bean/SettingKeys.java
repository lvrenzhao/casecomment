package cn.gov.ahcourt.casecomment.bean;

public enum SettingKeys {

	三审专家组("sszjz", "三审专家组配置");

	private String key;
	private String ms;

	SettingKeys(String key, String ms) {
		this.key = key;
		this.ms = ms;
	}

	public String getKey() {
		return key;
	}

	public String getMs() {
		return ms;
	}

}
