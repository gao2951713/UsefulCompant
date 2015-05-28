package com.ibest.entity.biz.pojo;

public class BizChartsParam {
    private Integer indicatorId;
	
    private String indicatorCode;
    
    private Integer rangeId;
    
    private String rangeCode;

    private String year;

	private String counts;

    private String grade;
    
    private boolean isHistory;

	public Integer getIndicatorId() {
		return indicatorId;
	}

	public void setIndicatorId(Integer indicatorId) {
		this.indicatorId = indicatorId;
	}

	public String getIndicatorCode() {
		return indicatorCode;
	}

	public void setIndicatorCode(String indicatorCode) {
		this.indicatorCode = indicatorCode;
	}

	public Integer getRangeId() {
		return rangeId;
	}

	public void setRangeId(Integer rangeId) {
		this.rangeId = rangeId;
	}

	public String getRangeCode() {
		return rangeCode;
	}

	public void setRangeCode(String rangeCode) {
		this.rangeCode = rangeCode;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getCounts() {
		return counts;
	}

	public void setCounts(String counts) {
		this.counts = counts;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public boolean isHistory() {
		return isHistory;
	}

	public void setHistory(boolean isHistory) {
		this.isHistory = isHistory;
	}

}