/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.message.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 留言信息管理Entity
 * @author zhuang
 * @version 2018-03-18
 */
public class MesReply extends DataEntity<MesReply> {
	
	private static final long serialVersionUID = 1L;
	private Message mesId;		// 留言表ID 父类
	private String teaId;		// tea_id
	private String content;		// 回复内容
	private String type;		// 回复类型
	private String status;		// 状态（0正常 1删除 2停用）
	
	public MesReply() {
		super();
	}

	public MesReply(String id){
		super(id);
	}

	public MesReply(Message mesId){
		this.mesId = mesId;
	}

	@Length(min=0, max=64, message="留言表ID长度必须介于 0 和 64 之间")
	public Message getMesId() {
		return mesId;
	}

	public void setMesId(Message mesId) {
		this.mesId = mesId;
	}
	
	@Length(min=0, max=64, message="tea_id长度必须介于 0 和 64 之间")
	public String getTeaId() {
		return teaId;
	}

	public void setTeaId(String teaId) {
		this.teaId = teaId;
	}
	
	@Length(min=0, max=255, message="回复内容长度必须介于 0 和 255 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=64, message="回复类型长度必须介于 0 和 64 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=1, max=1, message="状态（0正常 1删除 2停用）长度必须介于 1 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}