/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.student.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 考试成绩管理Entity
 * @author zhuang
 * @version 2018-03-18
 */
public class Exam extends DataEntity<Exam> {
	
	private static final long serialVersionUID = 1L;
	private Student student;		// 学生
	private String subject;		// 科目
	private String score;		// 分数
	private String commit;
	private Date examTime;		// 考试日期
	private String examName;		// 考试名称
	private Date beginExamTime;		// 开始 考试日期
	private Date endExamTime;		// 结束 考试日期
	
	public Exam() {
		super();
	}

	public Exam(String id){
		super(id);
	}

	public String getCommit() {
		return commit;
	}

	public void setCommit(String commit) {
		this.commit = commit;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	
	@Length(min=0, max=11, message="科目长度必须介于 0 和 11 之间")
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	@Length(min=0, max=20, message="分数长度必须介于 0 和 20 之间")
	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getExamTime() {
		return examTime;
	}

	public void setExamTime(Date examTime) {
		this.examTime = examTime;
	}
	
	@Length(min=0, max=64, message="考试名称长度必须介于 0 和 64 之间")
	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}
	
	public Date getBeginExamTime() {
		return beginExamTime;
	}

	public void setBeginExamTime(Date beginExamTime) {
		this.beginExamTime = beginExamTime;
	}
	
	public Date getEndExamTime() {
		return endExamTime;
	}

	public void setEndExamTime(Date endExamTime) {
		this.endExamTime = endExamTime;
	}
		
}