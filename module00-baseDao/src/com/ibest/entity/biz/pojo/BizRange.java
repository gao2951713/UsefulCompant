package com.ibest.entity.biz.pojo;

import java.util.List;

import javax.persistence.Transient;

public class BizRange implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7716612387075538226L;

	private String rangeCode;

	private String parentCode;

	private String rangeName;

	private List<BizRange> children;

	public String getRangeCode() {
		return rangeCode;
	}

	public void setRangeCode(String rangeCode) {
		this.rangeCode = rangeCode;
	}

	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public String getRangeName() {
		return rangeName;
	}

	public void setRangeName(String rangeName) {
		this.rangeName = rangeName;
	}

	@Transient
	public List<BizRange> getChildren() {
		return children;
	}

	public void setChildren(List<BizRange> children) {
		this.children = children;
	}
}
