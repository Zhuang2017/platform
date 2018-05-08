/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.message.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 留言信息管理Entity
 * @author zhuang
 * @version 2018-03-18
 */
public class Message extends DataEntity<Message> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户id
	private String trusts;		// 托管机构
	private String content;		// 留言内容
	private String title;		// 主题
	private String status;		// 状态（0正常 1删除 2停用）
	private List<MesReply> mesReplyList = Lists.newArrayList();		// 子表列表
	
	public Message() {
		super();
	}

	public Message(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=64, message="托管机构长度必须介于 0 和 64 之间")
	public String getTrusts() {
		return trusts;
	}

	public void setTrusts(String trusts) {
		this.trusts = trusts;
	}
	
	@Length(min=0, max=512, message="留言内容长度必须介于 0 和 512 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=100, message="主题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=1, max=1, message="状态（0正常 1删除 2停用）长度必须介于 1 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public List<MesReply> getMesReplyList() {
		return mesReplyList;
	}

	public void setMesReplyList(List<MesReply> mesReplyList) {
		this.mesReplyList = mesReplyList;
	}
}