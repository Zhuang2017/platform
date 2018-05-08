/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.trusts.web;

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
import com.thinkgem.jeesite.manage.trusts.entity.Trusts;
import com.thinkgem.jeesite.manage.trusts.service.TrustsService;

/**
 * 托管机构管理Controller
 * @author zhuang
 * @version 2018-03-18
 */
@Controller
@RequestMapping(value = "${adminPath}/trusts/trusts")
public class TrustsController extends BaseController {

	@Autowired
	private TrustsService trustsService;
	
	@ModelAttribute
	public Trusts get(@RequestParam(required=false) String id) {
		Trusts entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = trustsService.get(id);
		}
		if (entity == null){
			entity = new Trusts();
		}
		return entity;
	}
	
	@RequiresPermissions("trusts:trusts:view")
	@RequestMapping(value = {"list", ""})
	public String list(Trusts trusts, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Trusts> page = trustsService.findPage(new Page<Trusts>(request, response), trusts); 
		model.addAttribute("page", page);
		return "manage/trusts/trustsList";
	}

	@RequiresPermissions("trusts:trusts:view")
	@RequestMapping(value = "form")
	public String form(Trusts trusts, Model model) {
		model.addAttribute("trusts", trusts);
		return "manage/trusts/trustsForm";
	}

	@RequiresPermissions("trusts:trusts:edit")
	@RequestMapping(value = "save")
	public String save(Trusts trusts, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, trusts)){
			return form(trusts, model);
		}
		trustsService.save(trusts);
		addMessage(redirectAttributes, "保存托管机构成功");
		return "redirect:"+Global.getAdminPath()+"/trusts/trusts/?repage";
	}
	
	@RequiresPermissions("trusts:trusts:edit")
	@RequestMapping(value = "delete")
	public String delete(Trusts trusts, RedirectAttributes redirectAttributes) {
		trustsService.delete(trusts);
		addMessage(redirectAttributes, "删除托管机构成功");
		return "redirect:"+Global.getAdminPath()+"/trusts/trusts/?repage";
	}

}