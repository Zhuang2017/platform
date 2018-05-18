/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.student.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.manage.student.entity.Exam;

/**
 * 考试成绩管理DAO接口
 * @author zhuang
 * @version 2018-03-18
 */
@MyBatisDao
public interface ExamDao extends CrudDao<Exam> {

	List<Exam> queryListByStuId(@Param("stuId")String stuId, @Param("beginRow")int beginRow, @Param("rows")int rows);
	
}