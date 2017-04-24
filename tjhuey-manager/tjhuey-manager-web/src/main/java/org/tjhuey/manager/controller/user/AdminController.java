package org.tjhuey.manager.controller.user;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tjhuey.common.utils.Pager;
import org.tjhuey.manager.pojo.Address;
import org.tjhuey.manager.pojo.User;
import org.tjhuey.manager.service.user.AdminService;

/**
 * 系统管理员和前台管理员控制层
 * 
 * @author huey
 *
 */
@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	/**
	 * 退出当前登录
	 * 设置上次登录时间
	 * @param session
	 * @return
	 */
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		user.setLastTime((Date) session.getAttribute("forLastTime"));
		adminService.update(user);
		session.removeAttribute("loginUser");
		return "redirect:/login.jsp";
	}

	/**
	 * 批量删除
	 * 
	 * @param delArray
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteMultiAjax")
	public String deleteMultiAjax(HttpServletRequest request) {
		String[] values = request.getParameterValues("delArray[]");
		for (String string : values) {
			if (string != null && !"".equals(string)) {
				adminService.delete(Integer.parseInt(string));
			}
		}
		return null;
	}

	/**
	 * 指定一个单一删除
	 * 
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteAjax")
	public String deleteAjax(@RequestParam("userId") Integer userId) {
		adminService.delete(userId);
		return "ok";
	}

	/**
	 * 修改管理员
	 * 
	 * @param address
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateAjax")
	public String updateAjax(Address address, User user) {
		adminService.update(user, address);
		return null;
	}

	/**
	 * 查询管理员个人信息
	 * 
	 * @param userId
	 * @param map
	 * @return
	 */
	@RequestMapping("/queryAdminDetail")
	public String queryAdminDetail(@RequestParam("id") Integer userId, Map<String, Object> map) {
		User adminDetail = adminService.queryAdminById(userId);
		map.put("user", adminDetail);
		return "pages/admin/AdminEdit";
	}

	/**
	 * 插入管理员
	 * 
	 * @param address
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/insertAjax")
	public String insertAjax(Address address, User user) {
		adminService.save(user, address);
		return null;
	}

	/**
	 * 插入用户名操作校验数据中是否存在该用户名
	 * 
	 * @param userName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkUserNameAjax")
	public String checkUserNameAjax(@RequestParam("userName") String userName) {
		User userByUserName = adminService.checkUserByUserName(userName);
		if (userByUserName != null) {
			return "exist";
		}
		return null;
	}

	/**
	 * 查询所有相应管理员的信息，并分页处理
	 * 
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/queryAllAdmin")
	public String queryAllUser(HttpServletRequest request, Map<String, Object> map) {

		int pageSize = 0;
		// 默认从第一页开始
		int pageNum = 1;
		try {
			String pageSizeStr = request.getParameter("pageSize");
			String pageNumStr = request.getParameter("pageNum");
			if (pageSizeStr != null || "".equals(pageSizeStr)) {
				pageSize = Integer.parseInt(pageSizeStr);
			}
			if (pageNumStr != null || "".equals(pageNumStr)) {
				pageNum = Integer.parseInt(pageNumStr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Pager pager = null;
		if (pageSize != 0) {
			pager = new Pager(adminService.getCount(), pageNum, pageSize);
		} else {
			pager = new Pager(adminService.getCount(), pageNum);
		}
		List<User> list = adminService.queryByPager(pager);
		map.put("list", list);
		map.put("pager", pager);
		return "pages/admin/AdminAll";
	}

}
