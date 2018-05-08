/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.business.sale.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 销售网站Entity
 * @author zhuang
 * @version 2018-05-02
 */
public class SalesSite extends DataEntity<SalesSite> {
	
	private static final long serialVersionUID = 1L;
	private String number;		// 编号
	private String serverId;		// 服务器id
	private String serverAddress;		// 服务器登录地址
	private String ip;		// ip
	private String status;		// 网站状态标识：0不可用，1可用
	private Date onlineDate;		// 上线日期
	private String domainName;		// 域名
	private String userName;		// 用户名
	private String password;		// 密码
	private String region;		// 地区
	private String tempDomainName;		// 临时域名
	private String databasePassword;		// 数据库密码
	private String databaseUsername;		// 数据库用户名
	private Date beginOnlineDate;		// 开始 上线日期
	private Date endOnlineDate;		// 结束 上线日期
	
	public SalesSite() {
		super();
	}

	public SalesSite(String id){
		super(id);
	}

	@Length(min=0, max=11, message="编号长度必须介于 0 和 11 之间")
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	@Length(min=0, max=64, message="服务器id长度必须介于 0 和 64 之间")
	public String getServerId() {
		return serverId;
	}

	public void setServerId(String serverId) {
		this.serverId = serverId;
	}
	
	@Length(min=0, max=255, message="服务器登录地址长度必须介于 0 和 255 之间")
	public String getServerAddress() {
		return serverAddress;
	}

	public void setServerAddress(String serverAddress) {
		this.serverAddress = serverAddress;
	}
	
	@Length(min=0, max=64, message="ip长度必须介于 0 和 64 之间")
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@Length(min=0, max=1, message="网站状态标识：0不可用，1可用长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getOnlineDate() {
		return onlineDate;
	}

	public void setOnlineDate(Date onlineDate) {
		this.onlineDate = onlineDate;
	}
	
	@Length(min=0, max=255, message="域名长度必须介于 0 和 255 之间")
	public String getDomainName() {
		return domainName;
	}

	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}
	
	@Length(min=0, max=255, message="用户名长度必须介于 0 和 255 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=255, message="密码长度必须介于 0 和 255 之间")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Length(min=1, max=255, message="地区长度必须介于 1 和 255 之间")
	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}
	
	@Length(min=0, max=255, message="临时域名长度必须介于 0 和 255 之间")
	public String getTempDomainName() {
		return tempDomainName;
	}

	public void setTempDomainName(String tempDomainName) {
		this.tempDomainName = tempDomainName;
	}
	
	@Length(min=0, max=255, message="数据库密码长度必须介于 0 和 255 之间")
	public String getDatabasePassword() {
		return databasePassword;
	}

	public void setDatabasePassword(String databasePassword) {
		this.databasePassword = databasePassword;
	}
	
	@Length(min=0, max=255, message="数据库用户名长度必须介于 0 和 255 之间")
	public String getDatabaseUsername() {
		return databaseUsername;
	}

	public void setDatabaseUsername(String databaseUsername) {
		this.databaseUsername = databaseUsername;
	}
	
	public Date getBeginOnlineDate() {
		return beginOnlineDate;
	}

	public void setBeginOnlineDate(Date beginOnlineDate) {
		this.beginOnlineDate = beginOnlineDate;
	}
	
	public Date getEndOnlineDate() {
		return endOnlineDate;
	}

	public void setEndOnlineDate(Date endOnlineDate) {
		this.endOnlineDate = endOnlineDate;
	}
		
}