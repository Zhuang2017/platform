/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.student.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 作业完成情况Entity
 * @author zhuang
 * @version 2018-03-18
 */
public class Homework extends DataEntity<Homework> {
	
	private static final long serialVersionUID = 1L;
	private String subject;		// 科目
	private Student student;		// 学生
	private User teacher;		// 教师
	private String title;		// 题目
	private String content;		// 内容
	private Date assignTime;		// 布置时间
	private Date completionTime;		// 完成时间
	private String completionPic;		// 作业完成的照片
	private String comment;		// 完成情况
	private Date created;		// 创建时间
	private Date updated;		// 更新时间
	private String status;		// 状态（0正常 1删除 2停用）
	
	public Homework() {
		super();
	}

	public Homework(String id){
		super(id);
	}

	@Length(min=0, max=64, message="科目长度必须介于 0 和 64 之间")
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	
	public User getTeacher() {
		return teacher;
	}

	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}
	
	@Length(min=0, max=255, message="题目长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=255, message="内容长度必须介于 0 和 255 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAssignTime() {
		return assignTime;
	}

	public void setAssignTime(Date assignTime) {
		this.assignTime = assignTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCompletionTime() {
		return completionTime;
	}

	public void setCompletionTime(Date completionTime) {
		this.completionTime = completionTime;
	}
	
	@Length(min=0, max=255, message="作业完成的照片长度必须介于 0 和 255 之间")
	public String getCompletionPic() {
		return completionPic;
	}

	public void setCompletionPic(String completionPic) {
		this.completionPic = completionPic;
	}
	
	@Length(min=0, max=255, message="完成情况长度必须介于 0 和 255 之间")
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	
	@Length(min=1, max=1, message="状态（0正常 1删除 2停用）长度必须介于 1 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}