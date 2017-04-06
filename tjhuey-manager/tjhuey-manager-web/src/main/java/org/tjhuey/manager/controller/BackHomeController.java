package org.tjhuey.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.tjhuey.common.utils.AdvertisementUtil.Location;
import org.tjhuey.manager.common.service.AdvertisementsService;
import org.tjhuey.manager.pojo.t_advertisements;
import org.tjhuey.manager.pojo.t_supervisors;
import org.tjhuey.manager.user.service.SupervisorService;

/**
 * <p>
 * Description:
 * </p>
 * Path: org.tjhuey.manager.controller
 * <p>
 * Title: BackHomeController.java
 * </p>
 * Company: resource.huey.org>
 * 
 * @author huey
 * @date 2017年3月31日
 * @version 1.0
 */
@Controller
public class BackHomeController {

	@Autowired
	private AdvertisementsService advertisementsService;

	@Autowired
	private SupervisorService supervisorService;

	@RequestMapping("/")
	public String frontHomePre(Map<String, Object> map) {

		List<t_advertisements> banners = advertisementsService.getAdvertisementsFront(Location.HOME_TURN_ADS, 10);
		map.put("banners", banners);
		List<t_supervisors> supervisors = supervisorService.getAll();

		map.put("supervisors", supervisors);

		return "frontHome";
	}

}
