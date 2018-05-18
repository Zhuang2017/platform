package com.thinkgem.jeesite.manage.page.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.servlet.ValidateCodeServlet;
import com.thinkgem.jeesite.common.utils.CookieUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.manage.student.entity.Behaviour;
import com.thinkgem.jeesite.manage.student.entity.Exam;
import com.thinkgem.jeesite.manage.student.entity.Homework;
import com.thinkgem.jeesite.manage.student.entity.Student;
import com.thinkgem.jeesite.manage.student.service.BehaviourService;
import com.thinkgem.jeesite.manage.student.service.ExamService;
import com.thinkgem.jeesite.manage.student.service.HomeworkService;
import com.thinkgem.jeesite.manage.student.service.StudentService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.security.FormAuthenticationFilter;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.web.LoginController;

import junit.framework.Assert;

/**
 * 移动端页面视图控制器
 * @author zhuang
 *
 */
@Controller
@RequestMapping("${mobilePath}")
public class MobilePageController extends BaseController{

	@Autowired
	private SystemService systemService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private ExamService examService;
	@Autowired
	private BehaviourService behaviourService;
	/**
	 * 家长端登录
	 * 
	 * @param username
	 * @param password
	 * @param validateCode
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public String mobileLogin(String username, String password, String validateCode, Model model,
			HttpSession httpSession) {

		logger.info(" ===  username :{} === password :{}", username, password);
		String message = "";
		// 校验登录验证码
		if (LoginController.isValidateCodeLogin(username, false, false)) {
			Session session = UserUtils.getSession();
			String code = (String) session.getAttribute(ValidateCodeServlet.VALIDATE_CODE);
			if (validateCode == null || !validateCode.toUpperCase().equals(code)) {
				// throw new AuthenticationException("msg:验证码错误, 请重试.");
				message = "验证码错误, 请重试";
				model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);
				return "mobileTerminal/mobileLogin";
			}
		}
		// 校验用户名密码
		User user = systemService.getUserByLoginName(username);
		if (user != null) {
			if (Global.NO.equals(user.getLoginFlag())) {
				throw new AuthenticationException("msg:该已帐号禁止登录.");
			}
			// 登录成功
			if (user.getPassword().equals(password)) {
				// 进行登录成功的数据处理
				try {
					loginSeccessHandle(user, httpSession, model);
					return "mobileTerminal/index";
				} catch (Exception e) {
					logger.error("== 登录成功后，加载数据异常 ==错误信息：", e);
					message = "加载数据异常，请重新登录";
				}
			} else {
				message = "密码错误, 请重试";
				// throw new AuthenticationException("msg:账号或名密码错误.");
			}
		} else {
			message = "用户不存在, 请重试";
		}
		logger.info(" ===  message" + message + " ===");
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);
		return "mobileTerminal/mobileLogin";
	}

	private void loginSeccessHandle(User user, HttpSession session, Model model) throws Exception{
		List<Student> studentList = studentService.queryByUserId(user.getId());
		Office trusts = null;
		if(studentList != null && studentList.size()>0) {
			Student student = studentList.get(0);
			trusts = officeService.get(student.getTrusts().getId());
			session.setAttribute("trusts", trusts);
			session.setAttribute("student", student);
			
			model.addAttribute("student", student);
			model.addAttribute("studentList", studentList);
			logger.info("=== 有学生数据 === ");
		}
		session.setAttribute("user", user);
		logger.info("===  登录成功  ===");
	}
	@RequestMapping("/login")
	public String login(HttpServletResponse response) {
		logger.info("====  进入【登录】页面   ====");
		//设置退出登录
		CookieUtils.setCookie(response, "LOGINED", "false");
		return "mobileTerminal/mobileLogin";
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET )
	public String index() {
		logger.info("====  进入【主页】页面   ====");
		return "mobileTerminal/index";
	}
	@RequestMapping(value = "/homework", method = RequestMethod.GET )
	public String homework(HttpSession session, Model model) {
		logger.info("====  进入【作业情况】页面   ====");
		Student student = (Student) session.getAttribute("student");
		if (student == null) {
			return "mobileTerminal/homework";
		}
		List<Homework> homeworkList = homeworkService.queryListByStuId(student.getId());
		model.addAttribute("homeworkList", homeworkList);
		logger.info("====  homeworkList:{}   ====");
		return "mobileTerminal/homework";
	}
	@RequestMapping(value = "/about_us", method = RequestMethod.GET )
	public String aboutUs() {
		logger.info("====  进入【机构简介】页面   ====");
		return "mobileTerminal/about_us";
	}
	
	@RequestMapping(value = "/activities", method = RequestMethod.GET )
	public String activities() {
		logger.info("====  进入【活动】页面   ====");
		return "mobileTerminal/activities";
	}
	
	@RequestMapping(value = "/applicant", method = RequestMethod.GET )
	public String applicant() {
		logger.info("====  进入【applicant】页面   ====");
		return "mobileTerminal/applicant";
	}
	@RequestMapping(value = "/beha", method = RequestMethod.GET )
	public String beha(HttpSession session, Model model) {
		logger.info("====  进入【表现情况】页面   ====");
		Student student = (Student) session.getAttribute("student");
		if (student == null) {
			return "mobileTerminal/beha";
		}
		List<Behaviour> behaviourList = behaviourService.queryListByStuId(student.getId());
		model.addAttribute("behaviourList", behaviourList);
		return "mobileTerminal/beha";
	}
	@RequestMapping(value = "/course", method = RequestMethod.GET )
	public String course() {
		logger.info("====  进入【课程安排】页面   ====");
		return "mobileTerminal/course";
	}
	@RequestMapping(value = "/exam", method = RequestMethod.GET )
	public String exam(HttpSession session, Model model) {
		logger.info("====  进入【学习成绩】页面   ====");
		Student student = (Student) session.getAttribute("student");
		if (student == null) {
			return "mobileTerminal/exam";
		}
		List<Exam> examList = examService.queryListByStuId(student.getId());
		model.addAttribute("examList", examList);
		return "mobileTerminal/exam";
	}
	@RequestMapping(value = "/food", method = RequestMethod.GET )
	public String food() {
		logger.info("====  进入【一周食谱】页面   ====");
		return "mobileTerminal/food";
	}
	
	@RequestMapping(value = "/teacher", method = RequestMethod.GET )
	public String teacher() {
		logger.info("====  进入【教师团队】页面   ====");
		return "mobileTerminal/teacher";
	}
	
	@RequestMapping("/moblieLogin")
	public String moblieLogin() {
		System.out.println("moblieLogin");
		return "mobile/modules/sys/sysLogin";
	}
	
	@RequestMapping("/moblieIndex")
	public String moblieIndex() {
		System.out.println("moblieIndex");
		return "mobile/modules/sys/sysIndex";
	}
}
