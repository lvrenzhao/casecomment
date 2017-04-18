package cn.gov.ahcourt.casecomment.bean;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;

import com.alibaba.fastjson.annotation.JSONField;

public class BaseEntity implements Serializable {

	private static final long serialVersionUID = -8403155620112493066L;

	private Integer page;
	private Integer rows;
	private String sord;
	private String sidx;
	private Integer totalPage;
	private Integer totalCount;
	@JSONField(serialize = false)
	private Integer scopeType = 4;
	@JSONField(serialize = false)
	private String scopeId;
	@JSONField(serialize = false)
	private Object tempvalue;

	public Object getTempvalue() {
		return tempvalue;
	}

	public void setTempvalue(Object tempvalue) {
		this.tempvalue = tempvalue;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getScopeType() {
		return scopeType;
	}

	public void setScopeType(Integer scopeType) {
		this.scopeType = scopeType;
	}

	public String getScopeId() {
		return scopeId;
	}

	public void setScopeId(String scopeId) {
		this.scopeId = scopeId;
	}

	public boolean noRows() {
		return rows == null || rows < 1;
	}

	public boolean noPage() {
		return page == null || rows == null || page < 1 || rows < 1;
	}

	public boolean noOrder() {
		return StringUtils.isEmpty(sord) || StringUtils.isEmpty(sidx);
	}

	public boolean noRole() {
		return StringUtils.isEmpty(scopeId);
	}

	public <T> Map<String, Object> toMap(List<T> rows) {
		Map<String, Object> pageData = new HashMap<String, Object>();
		pageData.put("page", page);
		pageData.put("records", totalCount);
		pageData.put("total", totalPage);
		pageData.put("rows", rows);
		return pageData;
	}

}
