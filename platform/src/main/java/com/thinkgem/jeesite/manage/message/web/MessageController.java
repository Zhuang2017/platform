/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.message.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.manage.message.entity.Message;
import com.thinkgem.jeesite.manage.message.service.MessageService;

/**
 * 留言信息管理Controller
 * @author zhuang
 * @version 2018-03-18
 */
@Controller
@RequestMapping(value = "${adminPath}/message/message")
public class MessageController extends BaseController {

	@Autowired
	private MessageService messageService;
	
	@ModelAttribute
	public Message get(@RequestParam(required=false) String id) {
		Message entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = messageService.get(id);
		}
		if (entity == null){
			entity = new Message();
		}
		return entity;
	}
	
	@RequiresPermissions("message:message:view")
	@RequestMapping(value = {"list", ""})
	public String list(Message message, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Message> page = messageService.findPage(new Page<Message>(request, response), message); 
		model.addAttribute("page", page);
		return "manage/message/messageList";
	}

	@RequiresPermissions("message:message:view")
	@RequestMapping(value = "form")
	public String form(Message message, Model model) {
		model.addAttribute("message", message);
		return "manage/message/messageForm";
	}

	@RequiresPermissions("message:message:edit")
	@RequestMapping(value = "save")
	public String save(Message message, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, message)){
			return form(message, model);
		}
		messageService.save(message);
		addMessage(redirectAttributes, "保存留言信息成功");
		return "redirect:"+Global.getAdminPath()+"/message/message/?repage";
	}
	
	@RequiresPermissions("message:message:edit")
	@RequestMapping(value = "delete")
	public String delete(Message message, RedirectAttributes redirectAttributes) {
		messageService.delete(message);
		addMessage(redirectAttributes, "删除留言信息成功");
		return "redirect:"+Global.getAdminPath()+"/message/message/?repage";
	}

}