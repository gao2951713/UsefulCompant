package com.ibest.entity.biz.pojo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

/**
 * BizMenu entity. @author MyEclipse Persistence Tools
 */
@JsonInclude(Include.NON_NULL)
@Entity(name = "biz_comment")
public class BizComment implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 8920387418034426563L;
	private Integer commentId;
	private Integer menuId;
	private String chartType;
	private String rangeCode;
	private String comment;
	private Integer apiId;
	private Integer questionId;
	private Integer userId;
	private String userName;
	private Integer level;
	private Integer sort;
	private Timestamp createDate;

	
	// Constructors

	/** default constructor */
	public BizComment() {
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "comment_id", unique = true, nullable = false)
	public Integer getCommentId() {
		return this.commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	@Column(name = "menu_id", nullable = false)
	public Integer getMenuId() {
		return this.menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	@Column(name = "chart_type", nullable = false, length = 4)
	public String getChartType() {
		return this.chartType;
	}

	public void setChartType(String chartType) {
		this.chartType = chartType;
	}

	@Column(name = "range_code", nullable = false, length=12)
	public String getRangeCode() {
		return rangeCode;
	}

	public void setRangeCode(String rangeCode) {
		this.rangeCode = rangeCode;
	}

	@Column(name = "comment", nullable = true)
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Column(name = "api_id", nullable = false)
	public Integer getApiId() {
		return apiId;
	}

	public void setApiId(Integer apiId) {
		this.apiId = apiId;
	}

	@Column(name = "question_id", nullable = false)
	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	@Column(name = "user_id", nullable = false)
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "user_name", nullable = false)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Column(name = "level", nullable = false)
	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	@Column(name = "sort", nullable = false)
	public Integer getSort() {
		return this.sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Column(name = "create_date", nullable = false)
	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}


	
	
	
}