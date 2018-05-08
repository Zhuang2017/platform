/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.manage.student.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.manage.student.entity.Homework;
import com.thinkgem.jeesite.manage.student.entity.Student;
import com.thinkgem.jeesite.manage.student.service.HomeworkService;
import com.thinkgem.jeesite.manage.student.service.StudentService;

/**
 * 作业完成情况Controller
 * @author zhuang
 * @version 2018-03-18
 */
@Controller
@RequestMapping(value = "${adminPath}/student/homework")
public class HomeworkController extends BaseController {

	@Autowired
	private HomeworkService homeworkService;
	
	@Autowired
	private StudentService studentService;
	
	@ModelAttribute
	public Homework get(@RequestParam(required=false) String id) {
		Homework entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = homeworkService.get(id);
		}
		if (entity == null){
			entity = new Homework();
		}
		return entity;
	}
	
	@RequiresPermissions("student:homework:view")
	@RequestMapping(value = {"list", ""})
	public String list(Homework homework, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Homework> page = homeworkService.findPage(new Page<Homework>(request, response), homework); 
		model.addAttribute("page", page);
		return "manage/student/homeworkList";
	}

	@RequiresPermissions("student:homework:view")
	@RequestMapping(value = "form")
	public String form(Homework homework, Model model) {
		Assert.notNull(homework.getStudent(), "student is required");
		Student student = studentService.get(homework.getStudent());
		homework.setStudent(student);
		model.addAttribute("homework", homework);
		return "manage/student/homeworkForm";
	}

	@RequiresPermissions("student:homework:edit")
	@RequestMapping(value = "save")
	public String save(Homework homework, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, homework)){
			return form(homework, model);
		}
		homeworkService.save(homework);
		addMessage(redirectAttributes, "保存作业完成情况成功");
		return "redirect:"+Global.getAdminPath()+"/student/homework/?repage";
	}
	
	@RequiresPermissions("student:homework:edit")
	@RequestMapping(value = "delete")
	public String delete(Homework homework, RedirectAttributes redirectAttributes) {
		homeworkService.delete(homework);
		addMessage(redirectAttributes, "删除作业完成情况成功");
		return "redirect:"+Global.getAdminPath()+"/student/homework/?repage";
	}

}