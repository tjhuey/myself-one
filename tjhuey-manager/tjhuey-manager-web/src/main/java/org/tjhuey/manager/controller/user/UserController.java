package org.tjhuey.manager.controller.user;

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
import org.tjhuey.manager.service.user.UserService;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;

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
				userService.deleteById(Integer.parseInt(string));
			}
		}
		return null;
	}

	/**
	 * 插入会员
	 * 
	 * @param address
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/insertAjax")
	public String insertAjax(Address address, User user) {
		userService.save(user, address);
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
		userService.deleteById(userId);
		return "ok";
	}

	/**
	 * 修改会员
	 * 
	 * @param address
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateAjax")
	public String updateAjax(Address address, User user) {
		userService.update(user, address);
		return null;
	}

	/**
	 * 查询会员个人信息
	 * 
	 * @param userId
	 * @param map
	 * @return
	 */
	@RequestMapping("/queryUserDetail")
	public String queryUserDetail(@RequestParam("id") String userId, Map<String, Object> map) {
		User userDetail = userService.queryDetailById(userId);
		map.put("user", userDetail);
		return "pages/user/UserEdit";
	}

	/**
	 * 查询所有相应会员的信息，并分页处理
	 * 
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/queryAllUser")
	public String queryAllUser(HttpServletRequest request, Map<String, Object> map, HttpSession session) {

		int pageSize = 0;
		// 默认从第一页开始
		int pageNum = 1;
		String authority = request.getParameter("authority");
		if (authority != null) {
			session.setAttribute("authority", authority);
		}
		authority = (String) session.getAttribute("authority");

		int authorityInt = Integer.parseInt(authority);
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
			pager = new Pager(userService.getCount(authorityInt), pageNum, pageSize);
		} else {
			pager = new Pager(userService.getCount(authorityInt), pageNum);
		}
		List<User> list = userService.queryByPager(pager, authorityInt);
		map.put("list", list);
		map.put("pager", pager);
		return "pages/user/UserAll";
	}

}
