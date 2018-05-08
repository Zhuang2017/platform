/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.sign.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.manage.sign.entity.Sign;

/**
 * 签到表DAO接口
 * @author zhuang
 * @version 2018-03-20
 */
@MyBatisDao
public interface SignDao extends CrudDao<Sign> {
	
}