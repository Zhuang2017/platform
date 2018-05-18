/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.student.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.manage.student.entity.Behaviour;
import com.thinkgem.jeesite.manage.student.entity.Exam;
import com.thinkgem.jeesite.manage.student.dao.BehaviourDao;

/**
 * 学生表现信息Service
 * @author zhuang
 * @version 2018-03-18
 */
@Service
@Transactional(readOnly = true)
public class BehaviourService extends CrudService<BehaviourDao, Behaviour> {

	@Autowired
	private BehaviourDao behaviourDao;
	
	public Behaviour get(String id) {
		return super.get(id);
	}
	
	public List<Behaviour> findList(Behaviour behaviour) {
		return super.findList(behaviour);
	}
	
	public Page<Behaviour> findPage(Page<Behaviour> page, Behaviour behaviour) {
		return super.findPage(page, behaviour);
	}
	
	@Transactional(readOnly = false)
	public void save(Behaviour behaviour) {
		super.save(behaviour);
	}
	
	@Transactional(readOnly = false)
	public void delete(Behaviour behaviour) {
		super.delete(behaviour);
	}
	
	public List<Behaviour> queryListByStuId(String stuId) {
		return behaviourDao.queryListByStuId(stuId, 0, 6);
	}
	
}