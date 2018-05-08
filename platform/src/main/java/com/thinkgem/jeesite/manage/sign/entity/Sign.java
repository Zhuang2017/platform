/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.sign.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 签到表Entity
 * @author zhuang
 * @version 2018-03-20
 */
public class Sign extends DataEntity<Sign> {
	
	private static final long serialVersionUID = 1L;
	private String student;		// 学生
	private Date signDate;		// 签到日期
	private String signNo1;		// 第一次签到
	private Date signTime1;		// sign_time1
	private String signNo2;		// 第二次签到
	private Date signTime2;		// sign_time2
	private String signNo3;		// 第三次签到
	private Date signTime3;		// sign_time3
	private String signNo4;		// 第四次签到
	private Date signTime4;		// sign_time4
	private Date beginSignDate;		// 开始 签到日期
	private Date endSignDate;		// 结束 签到日期
	
	public Sign() {
		super();
	}

	public Sign(String id){
		super(id);
	}

	@Length(min=0, max=64, message="学生长度必须介于 0 和 64 之间")
	public String getStudent() {
		return student;
	}

	public void setStudent(String student) {
		this.student = student;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}
	
	@Length(min=0, max=32, message="第一次签到长度必须介于 0 和 32 之间")
	public String getSignNo1() {
		return signNo1;
	}

	public void setSignNo1(String signNo1) {
		this.signNo1 = signNo1;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getSignTime1() {
		return signTime1;
	}

	public void setSignTime1(Date signTime1) {
		this.signTime1 = signTime1;
	}
	
	@Length(min=0, max=32, message="第二次签到长度必须介于 0 和 32 之间")
	public String getSignNo2() {
		return signNo2;
	}

	public void setSignNo2(String signNo2) {
		this.signNo2 = signNo2;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getSignTime2() {
		return signTime2;
	}

	public void setSignTime2(Date signTime2) {
		this.signTime2 = signTime2;
	}
	
	@Length(min=0, max=32, message="第三次签到长度必须介于 0 和 32 之间")
	public String getSignNo3() {
		return signNo3;
	}

	public void setSignNo3(String signNo3) {
		this.signNo3 = signNo3;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getSignTime3() {
		return signTime3;
	}

	public void setSignTime3(Date signTime3) {
		this.signTime3 = signTime3;
	}
	
	@Length(min=0, max=32, message="第四次签到长度必须介于 0 和 32 之间")
	public String getSignNo4() {
		return signNo4;
	}

	public void setSignNo4(String signNo4) {
		this.signNo4 = signNo4;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getSignTime4() {
		return signTime4;
	}

	public void setSignTime4(Date signTime4) {
		this.signTime4 = signTime4;
	}
	
	public Date getBeginSignDate() {
		return beginSignDate;
	}

	public void setBeginSignDate(Date beginSignDate) {
		this.beginSignDate = beginSignDate;
	}
	
	public Date getEndSignDate() {
		return endSignDate;
	}

	public void setEndSignDate(Date endSignDate) {
		this.endSignDate = endSignDate;
	}
		
}