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
@Entity(name = "doc_notice_info")
public class DocNoticeInfo implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -6189611146376817556L;
	private Integer msgId;
	private String msgContent;
	private String title;
	private String subTitle;
	private Integer status;
	private Integer authorId;
	private String authorName;
	private Timestamp createDate;

	// Constructors

	/** default constructor */
	public DocNoticeInfo() {
	}

	/** minimal constructor */
	public DocNoticeInfo(Integer msgId, String msgContent, String title,
			String subTitle, Integer status) {
		this.msgId = msgId;
		this.msgContent = msgContent;
		this.title = title;
		this.subTitle = subTitle;
		this.status = status;
	}

	/** full constructor */
	public DocNoticeInfo(Integer msgId, String msgContent, String title,
			String subTitle, Integer status,Integer authorId,String authorName,
			Timestamp createDate) {
		this.msgId = msgId;
		this.msgContent = msgContent;
		this.title = title;
		this.subTitle = subTitle;
		this.status = status;
		this.authorId = authorId;
		this.authorName = authorName;
		this.createDate = createDate;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "msg_id", unique = true, nullable = false)
	public Integer getMsgId() {
		return this.msgId;
	}

	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}

	@Column(name = "msg_content",nullable = false, length = 2000)
	public String getMsgContent() {
		return this.msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	@Column(name = "title", nullable = false, length = 150)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "sub_title", length = 150)
	public String getSubTitle() {
		return this.subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	@Column(name = "status", nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "author_id", nullable = false)
	public Integer getAuthorId() {
		return this.authorId;
	}

	public void setAuthorId(Integer authorId) {
		this.authorId = authorId;
	}
	
	@Column(name = "author_name",  length = 50)
	public String getAuthorName() {
		return this.authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	@Column(name = "create_date", length = 19)
	public Timestamp getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

}