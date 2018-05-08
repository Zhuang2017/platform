/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.sign.web;

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
import com.thinkgem.jeesite.common.constants.Constant;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.manage.sign.entity.Sign;
import com.thinkgem.jeesite.manage.sign.service.SignService;
import com.thinkgem.jeesite.manage.student.entity.Student;
import com.thinkgem.jeesite.manage.student.service.StudentService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 签到表Controller
 * @author zhuang
 * @version 2018-03-20
 */
@Controller
@RequestMapping(value = "${adminPath}/sign/sign")
public class SignController extends BaseController {

	@Autowired
	private SignService signService;
	@Autowired
	private StudentService studentService;
	
	@ModelAttribute
	public Sign get(@RequestParam(required=false) String id) {
		Sign entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = signService.get(id);
		}
		if (entity == null){
			entity = new Sign();
		}
		return entity;
	}
	
	@RequiresPermissions("sign:sign:view")
	@RequestMapping(value = {"list", ""})
	public String list(Sign sign, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Sign> page = signService.findPage(new Page<Sign>(request, response), sign); 
		model.addAttribute("page", page);
		return "manage/sign/signList";
	}

	@RequiresPermissions("sign:sign:view")
	@RequestMapping(value = {"studentSign", ""})
	public String studentSign(Student student, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		//判断用户类型是机构人员的话，则只查询所在的托管机构下的学生
		if(StringUtils.equals(user.getUserType(), Constant.USER_TYPE_TRUSTS_STAFF)) {
			student.setTrusts(user.getOffice());
		}
		Page<Student> page = studentService.findPage(new Page<Student>(request, response), student); 
		model.addAttribute("page", page);
		return "manage/sign/studentSign";
	}
	@RequiresPermissions("sign:sign:view")
	@RequestMapping(value = "form")
	public String form(Sign sign, Model model) {
		model.addAttribute("sign", sign);
		return "manage/sign/signForm";
	}

	@RequiresPermissions("sign:sign:edit")
	@RequestMapping(value = "save")
	public String save(Sign sign, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sign)){
			return form(sign, model);
		}
		signService.save(sign);
		addMessage(redirectAttributes, "保存签到信息成功");
		return "redirect:"+Global.getAdminPath()+"/sign/sign/?repage";
	}
	
	@RequestMapping(value = "test")
	public String test(Sign sign, RedirectAttributes redirectAttributes) {
		return "manage/sign/sysLogin";
	}
	
	@RequiresPermissions("sign:sign:edit")
	@RequestMapping(value = "delete")
	public String delete(Sign sign, RedirectAttributes redirectAttributes) {
		signService.delete(sign);
		addMessage(redirectAttributes, "删除签到信息成功");
		return "redirect:"+Global.getAdminPath()+"/sign/sign/?repage";
	}

}