/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.trusts.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.manage.trusts.entity.Trusts;
import com.thinkgem.jeesite.manage.trusts.dao.TrustsDao;

/**
 * 托管机构管理Service
 * @author zhuang
 * @version 2018-03-18
 */
@Service
@Transactional(readOnly = true)
public class TrustsService extends CrudService<TrustsDao, Trusts> {

	public Trusts get(String id) {
		return super.get(id);
	}
	
	public List<Trusts> findList(Trusts trusts) {
		return super.findList(trusts);
	}
	
	public Page<Trusts> findPage(Page<Trusts> page, Trusts trusts) {
		return super.findPage(page, trusts);
	}
	
	@Transactional(readOnly = false)
	public void save(Trusts trusts) {
		super.save(trusts);
	}
	
	@Transactional(readOnly = false)
	public void delete(Trusts trusts) {
		super.delete(trusts);
	}
	
}