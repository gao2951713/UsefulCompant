package com.ibest.entity.biz.pojo;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

/**
 * DocReport entity. @author MyEclipse Persistence Tools
 */
@Entity(name = "doc_report")
public class DocReport implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -6189634246376817556L;
	private Integer reportId;
	private Integer apiId;
	private String areaCode;
	private String schoolCode;
	private String fileName;
	private String fileType;
	private String fileUrl;
	private String reportType;
	private String comment;
	private Integer updateUser;
	private Timestamp updateTime;

	// Constructors

	/** default constructor */
	public DocReport() {
	}

	/** minimal constructor */
	public DocReport(Integer apiId, String fileName, String fileType,
			String fileUrl, String reportType) {
		this.apiId = apiId;
		this.fileName = fileName;
		this.fileType = fileType;
		this.fileUrl = fileUrl;
		this.reportType = reportType;
	}

	/** full constructor */
	public DocReport(Integer apiId, String areaCode, String schoolCode,
			String fileName, String fileType, String fileUrl,
			String reportType, String comment, Integer updateUser,
			Timestamp updateTime) {
		this.apiId = apiId;
		this.areaCode = areaCode;
		this.schoolCode = schoolCode;
		this.fileName = fileName;
		this.fileType = fileType;
		this.fileUrl = fileUrl;
		this.reportType = reportType;
		this.comment = comment;
		this.updateUser = updateUser;
		this.updateTime = updateTime;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "report_id", unique = true, nullable = false)
	public Integer getReportId() {
		return this.reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}

	@Column(name = "api_id", nullable = false)
	public Integer getApiId() {
		return this.apiId;
	}

	public void setApiId(Integer apiId) {
		this.apiId = apiId;
	}

	@Column(name = "area_code", length = 4)
	public String getAreaCode() {
		return this.areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	@Column(name = "school_code", length = 8)
	public String getSchoolCode() {
		return this.schoolCode;
	}

	public void setSchoolCode(String schoolCode) {
		this.schoolCode = schoolCode;
	}

	@Column(name = "file_name", nullable = false, length = 200)
	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "file_type", nullable = false, length = 4)
	public String getFileType() {
		return this.fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	@Column(name = "file_url", nullable = false, length = 1024)
	public String getFileUrl() {
		return this.fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	@Column(name = "report_type", nullable = false, length = 2)
	public String getReportType() {
		return this.reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	@Column(name = "comment", length = 200)
	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Column(name = "update_user")
	public Integer getUpdateUser() {
		return this.updateUser;
	}

	public void setUpdateUser(Integer updateUser) {
		this.updateUser = updateUser;
	}

	@Column(name = "update_time", length = 19)
	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

}