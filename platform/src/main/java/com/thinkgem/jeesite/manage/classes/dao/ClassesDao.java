/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.classes.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.manage.classes.entity.Classes;

/**
 * 班级信息管理DAO接口
 * @author zhuang
 * @version 2018-03-18
 */
@MyBatisDao
public interface ClassesDao extends CrudDao<Classes> {
	
}