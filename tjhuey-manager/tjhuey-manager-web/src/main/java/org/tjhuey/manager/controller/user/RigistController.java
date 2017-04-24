package org.tjhuey.manager.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tjhuey.manager.pojo.Address;
import org.tjhuey.manager.pojo.User;
import org.tjhuey.manager.service.user.AdminService;

/**
 * 注册模块
 * @author huey
 *
 */
@Controller
public class RigistController {

	//通过admin业务来注册
	@Autowired
	private AdminService adminService;
	/**
	 * 注册
	 * 
	 * @param address
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/rigistAjax")
	public String insertAjax(Address address, User user) {
		adminService.save(user, address);
		return null;
	}
	
	
}
