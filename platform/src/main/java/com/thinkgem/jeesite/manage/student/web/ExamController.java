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
import com.thinkgem.jeesite.manage.student.entity.Exam;
import com.thinkgem.jeesite.manage.student.entity.Student;
import com.thinkgem.jeesite.manage.student.service.ExamService;
import com.thinkgem.jeesite.manage.student.service.StudentService;

/**
 * 考试成绩管理Controller
 * @author zhuang
 * @version 2018-03-18
 */
@Controller
@RequestMapping(value = "${adminPath}/student/exam")
public class ExamController extends BaseController {

	@Autowired
	private ExamService examService;
	
	@Autowired
	private StudentService studentService;
	
	@ModelAttribute
	public Exam get(@RequestParam(required=false) String id) {
		Exam entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examService.get(id);
		}
		if (entity == null){
			entity = new Exam();
		}
		return entity;
	}
	
	@RequiresPermissions("student:exam:view")
	@RequestMapping(value = {"list", ""})
	public String list(Exam exam, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Exam> page = examService.findPage(new Page<Exam>(request, response), exam); 
		model.addAttribute("page", page);
		return "manage/student/examList";
	}

	@RequiresPermissions("student:exam:view")
	@RequestMapping(value = "form")
	public String form(Exam exam, Model model) {
		Assert.notNull(exam.getStudent(), "student is required");
		Student student = studentService.get(exam.getStudent());
		exam.setStudent(student);
		model.addAttribute("exam", exam);
		return "manage/student/examForm";
	}

	@RequiresPermissions("student:exam:edit")
	@RequestMapping(value = "save")
	public String save(Exam exam, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, exam)){
			return form(exam, model);
		}
		examService.save(exam);
		addMessage(redirectAttributes, "保存成绩信息成功");
		return "redirect:"+Global.getAdminPath()+"/student/exam/?repage";
	}
	
	@RequiresPermissions("student:exam:edit")
	@RequestMapping(value = "delete")
	public String delete(Exam exam, RedirectAttributes redirectAttributes) {
		examService.delete(exam);
		addMessage(redirectAttributes, "删除成绩信息成功");
		return "redirect:"+Global.getAdminPath()+"/student/exam/?repage";
	}

}