/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.classes.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 班级信息管理Entity
 * @author zhuang
 * @version 2018-03-18
 */
public class Classes extends DataEntity<Classes> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 班级名称
	private String trusts;		// 托管机构
	
	public Classes() {
		super();
	}

	public Classes(String id){
		super(id);
	}

	@Length(min=0, max=64, message="班级名称长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="托管机构长度必须介于 0 和 64 之间")
	public String getTrusts() {
		return trusts;
	}

	public void setTrusts(String trusts) {
		this.trusts = trusts;
	}
	
}