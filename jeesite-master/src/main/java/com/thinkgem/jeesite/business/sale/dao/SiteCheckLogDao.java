/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.business.sale.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.business.sale.entity.SiteCheckLog;

/**
 * 网站检测日志表DAO接口
 * @author zhuang
 * @version 2018-05-02
 */
@MyBatisDao
public interface SiteCheckLogDao extends CrudDao<SiteCheckLog> {
	
}