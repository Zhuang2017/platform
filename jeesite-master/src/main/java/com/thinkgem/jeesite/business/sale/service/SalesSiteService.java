/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.business.sale.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.business.sale.entity.SalesSite;
import com.thinkgem.jeesite.business.sale.dao.SalesSiteDao;

/**
 * 销售网站Service
 * @author zhuang
 * @version 2018-05-02
 */
@Service
@Transactional(readOnly = true)
public class SalesSiteService extends CrudService<SalesSiteDao, SalesSite> {

	public SalesSite get(String id) {
		return super.get(id);
	}
	
	public List<SalesSite> findList(SalesSite salesSite) {
		return super.findList(salesSite);
	}
	
	public Page<SalesSite> findPage(Page<SalesSite> page, SalesSite salesSite) {
		return super.findPage(page, salesSite);
	}
	
	@Transactional(readOnly = false)
	public void save(SalesSite salesSite) {
		super.save(salesSite);
	}
	
	@Transactional(readOnly = false)
	public void delete(SalesSite salesSite) {
		super.delete(salesSite);
	}
	
}