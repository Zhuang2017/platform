/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.student.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 学生表现信息Entity
 * @author zhuang
 * @version 2018-03-18
 */
public class Behaviour extends DataEntity<Behaviour> {
	
	private static final long serialVersionUID = 1L;
	private Student student;		// 学生
	private String content;		// 内容（如学生期间做的值得表扬的事）
	private String contentHtml;		// 内容（含标签）
	private Date behaDate;		// 表现的时间
	private String comment;		// 评价
	private User teacher;		// 教师
	private String status;		// 状态（0正常 1删除 2停用）
	
	public Behaviour() {
		super();
	}

	public Behaviour(String id){
		super(id);
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	
	@Length(min=0, max=512, message="内容   长度必须介于 0 和 512 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=512, message="内容（含标签）长度必须介于 0 和 512 之间")
	public String getContentHtml() {
		return contentHtml;
	}

	public void setContentHtml(String contentHtml) {
		this.contentHtml = contentHtml;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBehaDate() {
		return behaDate;
	}

	public void setBehaDate(Date behaDate) {
		this.behaDate = behaDate;
	}
	
	@Length(min=0, max=255, message="评价长度必须介于 0 和 255 之间")
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public User getTeacher() {
		return teacher;
	}

	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}
	
	@Length(min=1, max=1, message="状态（0正常 1删除 2停用）长度必须介于 1 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}