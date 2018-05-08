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
import com.thinkgem.jeesite.business.sale.entity.SalesSite;
import com.thinkgem.jeesite.business.sale.service.SalesSiteService;

/**
 * 销售网站Controller
 * @author zhuang
 * @version 2018-05-02
 */
@Controller
@RequestMapping(value = "${adminPath}/sale/salesSite")
public class SalesSiteController extends BaseController {

	@Autowired
	private SalesSiteService salesSiteService;
	
	@ModelAttribute
	public SalesSite get(@RequestParam(required=false) String id) {
		SalesSite entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = salesSiteService.get(id);
		}
		if (entity == null){
			entity = new SalesSite();
		}
		return entity;
	}
	
	@RequiresPermissions("sale:salesSite:view")
	@RequestMapping(value = {"list", ""})
	public String list(SalesSite salesSite, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SalesSite> page = salesSiteService.findPage(new Page<SalesSite>(request, response), salesSite); 
		model.addAttribute("page", page);
		return "business/sale/salesSiteList";
	}

	@RequiresPermissions("sale:salesSite:view")
	@RequestMapping(value = "form")
	public String form(SalesSite salesSite, Model model) {
		model.addAttribute("salesSite", salesSite);
		return "business/sale/salesSiteForm";
	}

	@RequiresPermissions("sale:salesSite:edit")
	@RequestMapping(value = "save")
	public String save(SalesSite salesSite, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, salesSite)){
			return form(salesSite, model);
		}
		salesSiteService.save(salesSite);
		addMessage(redirectAttributes, "保存销售网站成功");
		return "redirect:"+Global.getAdminPath()+"/sale/salesSite/?repage";
	}
	
	@RequiresPermissions("sale:salesSite:edit")
	@RequestMapping(value = "delete")
	public String delete(SalesSite salesSite, RedirectAttributes redirectAttributes) {
		salesSiteService.delete(salesSite);
		addMessage(redirectAttributes, "删除销售网站成功");
		return "redirect:"+Global.getAdminPath()+"/sale/salesSite/?repage";
	}

}