package org.tjhuey.manager.controller.user;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tjhuey.manager.pojo.User;
import org.tjhuey.manager.service.user.UserService;

/**
 * 检查登录
 * 
 * @author huey
 *
 */
@RequestMapping("/login")
@Controller
public class LoginController {

	
	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping("/checkLogin")
	public String checkLogin(HttpServletRequest request, HttpSession session) throws IOException {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		User user = userService.checkUser(userName);
		if (user == null) {
			// 用户名不存在
			return "error_username";
		} else if (!password.equals(user.getPassword())) {
			//密码不匹配
			return "error_password";
		} else {
			// 跳转之前先放入session
			session.setAttribute("loginUser", user);
			//存入session当前时间，为退出时保存上次用
			session.setAttribute("forLastTime", new Date());
			// 匹配跳转
			return "ok";
		}
	}
}
