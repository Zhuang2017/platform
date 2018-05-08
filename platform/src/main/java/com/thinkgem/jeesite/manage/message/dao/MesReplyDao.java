/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.message.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.manage.message.entity.MesReply;

/**
 * 留言信息管理DAO接口
 * @author zhuang
 * @version 2018-03-18
 */
@MyBatisDao
public interface MesReplyDao extends CrudDao<MesReply> {
	
}