/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.student.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.manage.student.entity.Homework;

/**
 * 作业完成情况DAO接口
 * @author zhuang
 * @version 2018-03-18
 */
@MyBatisDao
public interface HomeworkDao extends CrudDao<Homework> {
	
}