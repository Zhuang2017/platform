/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.manage.message.entity.Message;
import com.thinkgem.jeesite.manage.message.dao.MessageDao;
import com.thinkgem.jeesite.manage.message.entity.MesReply;
import com.thinkgem.jeesite.manage.message.dao.MesReplyDao;

/**
 * 留言信息管理Service
 * @author zhuang
 * @version 2018-03-18
 */
@Service
@Transactional(readOnly = true)
public class MessageService extends CrudService<MessageDao, Message> {

	@Autowired
	private MesReplyDao mesReplyDao;
	
	public Message get(String id) {
		Message message = super.get(id);
		message.setMesReplyList(mesReplyDao.findList(new MesReply(message)));
		return message;
	}
	
	public List<Message> findList(Message message) {
		return super.findList(message);
	}
	
	public Page<Message> findPage(Page<Message> page, Message message) {
		return super.findPage(page, message);
	}
	
	@Transactional(readOnly = false)
	public void save(Message message) {
		super.save(message);
		for (MesReply mesReply : message.getMesReplyList()){
			if (mesReply.getId() == null){
				continue;
			}
			if (MesReply.DEL_FLAG_NORMAL.equals(mesReply.getDelFlag())){
				if (StringUtils.isBlank(mesReply.getId())){
					mesReply.setMesId(message);
					mesReply.preInsert();
					mesReplyDao.insert(mesReply);
				}else{
					mesReply.preUpdate();
					mesReplyDao.update(mesReply);
				}
			}else{
				mesReplyDao.delete(mesReply);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(Message message) {
		super.delete(message);
		mesReplyDao.delete(new MesReply(message));
	}
	
}