/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.trusts.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 托管机构管理Entity
 * @author zhuang
 * @version 2018-03-18
 */
public class Trusts extends DataEntity<Trusts> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 机构名称
	private User leader;		// 园长
	private String address;		// 机构地址
	private String phone;		// 联系电话
	private String stuCount;		// 学生总数
	private String isConfirm;		// 激活标识：0、未激活 1、激活
	private String status;		// 状态（0正常 1删除 2停用）
	private String picSmall;		// 机构缩略图
	private String picBig;		// 机构主图
	
	public Trusts() {
		super();
	}

	public Trusts(String id){
		super(id);
	}

	@Length(min=0, max=30, message="机构名称长度必须介于 0 和 30 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@NotNull(message="园长不能为空")
	public User getLeader() {
		return leader;
	}

	public void setLeader(User leader) {
		this.leader = leader;
	}
	
	@Length(min=0, max=30, message="机构地址长度必须介于 0 和 30 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=1, max=20, message="联系电话长度必须介于 1 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=11, message="学生总数长度必须介于 0 和 11 之间")
	public String getStuCount() {
		return stuCount;
	}

	public void setStuCount(String stuCount) {
		this.stuCount = stuCount;
	}
	
	@Length(min=0, max=11, message="激活标识：0、未激活 1、激活长度必须介于 0 和 11 之间")
	public String getIsConfirm() {
		return isConfirm;
	}

	public void setIsConfirm(String isConfirm) {
		this.isConfirm = isConfirm;
	}
	
	@Length(min=0, max=1, message="状态（0正常 1删除 2停用）长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=30, message="机构缩略图长度必须介于 0 和 30 之间")
	public String getPicSmall() {
		return picSmall;
	}

	public void setPicSmall(String picSmall) {
		this.picSmall = picSmall;
	}
	
	@Length(min=0, max=30, message="机构主图长度必须介于 0 和 30 之间")
	public String getPicBig() {
		return picBig;
	}

	public void setPicBig(String picBig) {
		this.picBig = picBig;
	}
	
}