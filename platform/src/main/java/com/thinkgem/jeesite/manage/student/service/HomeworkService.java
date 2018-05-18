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
import com.thinkgem.jeesite.manage.student.entity.Homework;
import com.thinkgem.jeesite.manage.student.dao.HomeworkDao;

/**
 * 作业完成情况Service
 * @author zhuang
 * @version 2018-03-18
 */
@Service
@Transactional(readOnly = true)
public class HomeworkService extends CrudService<HomeworkDao, Homework> {
	@Autowired
	private HomeworkDao homeworkDao;
	public Homework get(String id) {
		return super.get(id);
	}
	
	public List<Homework> findList(Homework homework) {
		return super.findList(homework);
	}
	
	public Page<Homework> findPage(Page<Homework> page, Homework homework) {
		return super.findPage(page, homework);
	}
	
	@Transactional(readOnly = false)
	public void save(Homework homework) {
		super.save(homework);
	}
	
	@Transactional(readOnly = false)
	public void delete(Homework homework) {
		super.delete(homework);
	}
	
	public List<Homework> queryListByStuId(String stuId) {
		return homeworkDao.queryListByStuId(stuId, 0, 6);
	}
	
}