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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.manage.student.entity.Student;
import com.thinkgem.jeesite.manage.student.service.StudentService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 学生信息管理Controller
 * @author zhuang
 * @version 2018-03-18
 */
@Controller
@RequestMapping(value = "${adminPath}/student/student")
public class StudentController extends BaseController {

	@Autowired
	private StudentService studentService;
	
	private final static String USER_TYPE_TRUSTS_STAFF = "2";
	
	@ModelAttribute
	public Student get(@RequestParam(required=false) String id) {
		Student entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = studentService.get(id);
		}
		if (entity == null){
			entity = new Student();
		}
		return entity;
	}
	
	@RequiresPermissions("student:student:view")
	@RequestMapping(value = {"list", ""})
	public String list(Student student, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		//判断用户类型是机构人员的话，则只查询所在的托管机构下的学生
		if(StringUtils.equals(user.getUserType(), USER_TYPE_TRUSTS_STAFF)) {
			student.setTrusts(user.getOffice());
		}
		Page<Student> page = studentService.findPage(new Page<Student>(request, response), student); 
		model.addAttribute("page", page);
		return "manage/student/studentList";
	}
	
	@RequiresPermissions("student:student:view")
	@RequestMapping(value = {"operationList", ""})
	public String operationList(Student student, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		//判断用户类型是机构人员的话，则只查询所在的托管机构下的学生
		if(StringUtils.equals(user.getUserType(), USER_TYPE_TRUSTS_STAFF)) {
			student.setTrusts(user.getOffice());
		}
		Page<Student> page = studentService.findPage(new Page<Student>(request, response), student); 
		model.addAttribute("page", page);
		return "manage/student/studyOperation";
	}

	@RequiresPermissions("student:student:view")
	@RequestMapping(value = "form")
	public String form(Student student, Model model) {
		model.addAttribute("student", student);
		return "manage/student/studentForm";
	}

	@RequiresPermissions("student:student:edit")
	@RequestMapping(value = "save")
	public String save(Student student, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, student)){
			return form(student, model);
		}
		User user = UserUtils.getUser();
		student.setTrusts(user.getOffice());
		studentService.save(student);
		addMessage(redirectAttributes, "保存学生信息成功");
		return "redirect:"+Global.getAdminPath()+"/student/student/list";
	}
	
	@RequiresPermissions("student:student:edit")
	@RequestMapping(value = "delete")
	public String delete(Student student, RedirectAttributes redirectAttributes) {
		studentService.delete(student);
		addMessage(redirectAttributes, "删除学生信息成功");
		return "redirect:"+Global.getAdminPath()+"/student/student/list";
	}

}