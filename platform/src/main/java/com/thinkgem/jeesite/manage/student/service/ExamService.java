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
import com.thinkgem.jeesite.manage.student.entity.Exam;
import com.thinkgem.jeesite.manage.student.entity.Homework;
import com.thinkgem.jeesite.manage.student.dao.ExamDao;

/**
 * 考试成绩管理Service
 * @author zhuang
 * @version 2018-03-18
 */
@Service
@Transactional(readOnly = true)
public class ExamService extends CrudService<ExamDao, Exam> {

	@Autowired
	private ExamDao examDao;
	
	public Exam get(String id) {
		return super.get(id);
	}
	
	public List<Exam> findList(Exam exam) {
		return super.findList(exam);
	}
	
	public Page<Exam> findPage(Page<Exam> page, Exam exam) {
		return super.findPage(page, exam);
	}
	
	@Transactional(readOnly = false)
	public void save(Exam exam) {
		super.save(exam);
	}
	
	@Transactional(readOnly = false)
	public void delete(Exam exam) {
		super.delete(exam);
	}
	
	public List<Exam> queryListByStuId(String stuId) {
		return examDao.queryListByStuId(stuId, 0, 6);
	}
}