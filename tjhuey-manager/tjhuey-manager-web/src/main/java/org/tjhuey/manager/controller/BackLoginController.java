package org.tjhuey.manager.controller;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.tjhuey.common.utils.PagePrefixUtil;
import org.tjhuey.common.utils.UUIDUtil;

/**
 * <p>
 * Description:
 * </p>
 * Path: org.tjhuey.manager.controller
 * <p>
 * Title: BackLoginController.java
 * </p>
 * Company: resource.huey.org>
 * 
 * @author huey
 * @date 2017年3月31日
 * @version 1.0
 */
@RequestMapping("/supervisor")
@Controller
public class BackLoginController {

	/**
	 * <p>
	 * Description:去登录界面
	 * </p>
	 * 
	 * @author huey
	 * @date 2017年3月31日
	 */
	@RequestMapping("/toLogin")
	public String loginInit(Map<String, Object> map) {

		String randomID = UUIDUtil.getUUID();
		map.put("randomID", randomID);

		return PagePrefixUtil.PAGE_PREFIX + PagePrefixUtil.MODULE + "loginInit";
	}
}
