/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.business.sale.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.business.sale.entity.SiteCheckLog;
import com.thinkgem.jeesite.business.sale.dao.SiteCheckLogDao;

/**
 * 网站检测日志表Service
 * @author zhuang
 * @version 2018-05-02
 */
@Service
@Transactional(readOnly = true)
public class SiteCheckLogService extends CrudService<SiteCheckLogDao, SiteCheckLog> {

	public SiteCheckLog get(String id) {
		return super.get(id);
	}
	
	public List<SiteCheckLog> findList(SiteCheckLog siteCheckLog) {
		return super.findList(siteCheckLog);
	}
	
	public Page<SiteCheckLog> findPage(Page<SiteCheckLog> page, SiteCheckLog siteCheckLog) {
		return super.findPage(page, siteCheckLog);
	}
	
	@Transactional(readOnly = false)
	public void save(SiteCheckLog siteCheckLog) {
		super.save(siteCheckLog);
	}
	
	@Transactional(readOnly = false)
	public void delete(SiteCheckLog siteCheckLog) {
		super.delete(siteCheckLog);
	}
	
}