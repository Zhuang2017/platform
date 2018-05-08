/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.business.sale.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 网站检测日志表Entity
 * @author zhuang
 * @version 2018-05-02
 */
public class SiteCheckLog extends DataEntity<SiteCheckLog> {
	
	private static final long serialVersionUID = 1L;
	private String salesSite;		// 检测网站
	private String statusCode;		// 状态码
	private String checkResult;		// 检测结果
	private String checkLog;		// 检测日志
	private String itemTotal;		// 商品总数
	private String status;		// 网站状态
	private String beginItemTotal;		// 开始 商品总数
	private String endItemTotal;		// 结束 商品总数
	
	public SiteCheckLog() {
		super();
	}

	public SiteCheckLog(String id){
		super(id);
	}

	@Length(min=1, max=64, message="检测网站长度必须介于 1 和 64 之间")
	public String getSalesSite() {
		return salesSite;
	}

	public void setSalesSite(String salesSite) {
		this.salesSite = salesSite;
	}
	
	@Length(min=0, max=10, message="状态码长度必须介于 0 和 10 之间")
	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	
	@Length(min=0, max=255, message="检测结果长度必须介于 0 和 255 之间")
	public String getCheckResult() {
		return checkResult;
	}

	public void setCheckResult(String checkResult) {
		this.checkResult = checkResult;
	}
	
	@Length(min=0, max=1024, message="检测日志长度必须介于 0 和 1024 之间")
	public String getCheckLog() {
		return checkLog;
	}

	public void setCheckLog(String checkLog) {
		this.checkLog = checkLog;
	}
	
	@Length(min=0, max=255, message="商品总数长度必须介于 0 和 255 之间")
	public String getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(String itemTotal) {
		this.itemTotal = itemTotal;
	}
	
	@Length(min=0, max=1, message="网站状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getBeginItemTotal() {
		return beginItemTotal;
	}

	public void setBeginItemTotal(String beginItemTotal) {
		this.beginItemTotal = beginItemTotal;
	}
	
	public String getEndItemTotal() {
		return endItemTotal;
	}

	public void setEndItemTotal(String endItemTotal) {
		this.endItemTotal = endItemTotal;
	}
		
}