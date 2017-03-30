package org.tjhuey.manager.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.tjhuey.user.pojo.User;
import org.tjhuey.user.service.UserService;

import net.sf.jsqlparser.statement.create.table.Index;

/**
 * <p>
 * Description:
 * </p>
 * Path: org.tjhuey.controller
 * <p>
 * Title: UserController.java
 * </p>
 * Company: resource.huey.org>
 * 
 * @author huey
 * @date 2017年3月29日
 * @version 1.0
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/")
	public String Index() {
		return "index";
	}

	@RequestMapping("/{userId}")
	public String getUserById(@PathVariable("userId") Integer userId, Map<String, Object> map) {
		User user = userService.getUserById(userId);
		map.put("user", user);
		return "index";
	}
}
