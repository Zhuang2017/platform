/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.classes.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.manage.classes.entity.Classes;
import com.thinkgem.jeesite.manage.classes.dao.ClassesDao;

/**
 * 班级信息管理Service
 * @author zhuang
 * @version 2018-03-18
 */
@Service
@Transactional(readOnly = true)
public class ClassesService extends CrudService<ClassesDao, Classes> {

	public Classes get(String id) {
		return super.get(id);
	}
	
	public List<Classes> findList(Classes classes) {
		return super.findList(classes);
	}
	
	public Page<Classes> findPage(Page<Classes> page, Classes classes) {
		return super.findPage(page, classes);
	}
	
	@Transactional(readOnly = false)
	public void save(Classes classes) {
		super.save(classes);
	}
	
	@Transactional(readOnly = false)
	public void delete(Classes classes) {
		super.delete(classes);
	}
	
}