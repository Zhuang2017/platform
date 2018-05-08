/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.business.sale.web;

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
import com.thinkgem.jeesite.business.sale.entity.SiteCheckLog;
import com.thinkgem.jeesite.business.sale.service.SiteCheckLogService;

/**
 * 网站检测日志表Controller
 * @author zhuang
 * @version 2018-05-02
 */
@Controller
@RequestMapping(value = "${adminPath}/sale/siteCheckLog")
public class SiteCheckLogController extends BaseController {

	@Autowired
	private SiteCheckLogService siteCheckLogService;
	
	@ModelAttribute
	public SiteCheckLog get(@RequestParam(required=false) String id) {
		SiteCheckLog entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = siteCheckLogService.get(id);
		}
		if (entity == null){
			entity = new SiteCheckLog();
		}
		return entity;
	}
	
	@RequiresPermissions("sale:siteCheckLog:view")
	@RequestMapping(value = {"list", ""})
	public String list(SiteCheckLog siteCheckLog, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SiteCheckLog> page = siteCheckLogService.findPage(new Page<SiteCheckLog>(request, response), siteCheckLog); 
		model.addAttribute("page", page);
		return "business/sale/siteCheckLogList";
	}

	@RequiresPermissions("sale:siteCheckLog:view")
	@RequestMapping(value = "form")
	public String form(SiteCheckLog siteCheckLog, Model model) {
		model.addAttribute("siteCheckLog", siteCheckLog);
		return "business/sale/siteCheckLogForm";
	}

	@RequiresPermissions("sale:siteCheckLog:edit")
	@RequestMapping(value = "save")
	public String save(SiteCheckLog siteCheckLog, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, siteCheckLog)){
			return form(siteCheckLog, model);
		}
		siteCheckLogService.save(siteCheckLog);
		addMessage(redirectAttributes, "保存日志成功");
		return "redirect:"+Global.getAdminPath()+"/sale/siteCheckLog/?repage";
	}
	
	@RequiresPermissions("sale:siteCheckLog:edit")
	@RequestMapping(value = "delete")
	public String delete(SiteCheckLog siteCheckLog, RedirectAttributes redirectAttributes) {
		siteCheckLogService.delete(siteCheckLog);
		addMessage(redirectAttributes, "删除日志成功");
		return "redirect:"+Global.getAdminPath()+"/sale/siteCheckLog/?repage";
	}

}