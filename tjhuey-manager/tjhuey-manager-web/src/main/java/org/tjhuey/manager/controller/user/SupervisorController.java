package org.tjhuey.manager.controller.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.tjhuey.manager.pojo.t_supervisors;
import org.tjhuey.manager.service.user.SupervisorService;

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
public class SupervisorController {

	@Autowired
	private SupervisorService supervisorService;


	@RequestMapping("/{userId}")
	public String getById(@PathVariable("userId") Long userId, Map<String, Object> map) {
		t_supervisors t_supervisor = supervisorService.getById(userId);
		map.put("supervisor", t_supervisor);

		return "index";
	}
}
