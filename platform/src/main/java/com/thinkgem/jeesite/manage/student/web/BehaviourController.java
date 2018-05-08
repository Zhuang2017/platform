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
import com.thinkgem.jeesite.manage.student.entity.Behaviour;
import com.thinkgem.jeesite.manage.student.entity.Student;
import com.thinkgem.jeesite.manage.student.service.BehaviourService;
import com.thinkgem.jeesite.manage.student.service.StudentService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 学生表现信息Controller
 * @author zhuang
 * @version 2018-03-18
 */
@Controller
@RequestMapping(value = "${adminPath}/student/behaviour")
public class BehaviourController extends BaseController {

	@Autowired
	private BehaviourService behaviourService;
	
	@Autowired
	private StudentService studentService;
	
	@ModelAttribute
	public Behaviour get(@RequestParam(required=false) String id) {
		Behaviour entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = behaviourService.get(id);
		}
		if (entity == null){
			entity = new Behaviour();
		}
		return entity;
	}
	
	@RequiresPermissions("student:behaviour:view")
	@RequestMapping(value = {"list", ""})
	public String list(Behaviour behaviour, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Behaviour> page = behaviourService.findPage(new Page<Behaviour>(request, response), behaviour); 
		model.addAttribute("page", page);
		return "manage/student/behaviourList";
	}

	@RequiresPermissions("student:behaviour:view")
	@RequestMapping(value = "form")
	public String form(Behaviour behaviour, Model model) {
		Assert.notNull(behaviour.getStudent(), "student is required");
		Student student = studentService.get(behaviour.getStudent());
		behaviour.setStudent(student);
		model.addAttribute("behaviour", behaviour);
		return "manage/student/behaviourForm";
	}

	@RequiresPermissions("student:behaviour:edit")
	@RequestMapping(value = "save")
	public String save(Behaviour behaviour, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, behaviour)){
			return form(behaviour, model);
		}
		behaviour.setTeacher(UserUtils.getUser());
		behaviourService.save(behaviour);
		addMessage(redirectAttributes, "保存表现信息成功");
		return "redirect:"+Global.getAdminPath()+"/student/behaviour/?repage";
	}
	
	@RequiresPermissions("student:behaviour:edit")
	@RequestMapping(value = "delete")
	public String delete(Behaviour behaviour, RedirectAttributes redirectAttributes) {
		behaviourService.delete(behaviour);
		addMessage(redirectAttributes, "删除表现信息成功");
		return "redirect:"+Global.getAdminPath()+"/student/behaviour/?repage";
	}

}