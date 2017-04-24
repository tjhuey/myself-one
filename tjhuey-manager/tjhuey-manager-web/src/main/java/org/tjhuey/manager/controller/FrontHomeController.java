package org.tjhuey.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.tjhuey.common.utils.AdvertisementUtil.Location;
import org.tjhuey.manager.pojo.t_advertisements;
import org.tjhuey.manager.service.common.AdvertisementsService;

/**
 * <p>Description: </p>
 * Path: org.tjhuey.manager.controller
 * <p>Title: FrontHomeController.java</p>
 * Company: resource.huey.org
 * @author huey
 * @date 2017年4月20日
 * @version 1.0
 */
@Controller
public class FrontHomeController {

	@Autowired
	private AdvertisementsService advertisementsService;

	@RequestMapping("/")
	public String frontHomePre(Map<String, Object> map) {

		List<t_advertisements> banners = advertisementsService.getAdvertisementsFront(Location.HOME_TURN_ADS, 10);
		map.put("banners", banners);

		return "frontHome";
	}
}
