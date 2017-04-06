package org.tjhuey.manager.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tjhuey.common.utils.AdvertisementUtil.Location;
import org.tjhuey.manager.common.service.AdvertisementsService;
import org.tjhuey.manager.mapper.t_advertisementsMapper;
import org.tjhuey.manager.pojo.t_advertisements;

/**
 * <p>
 * Description:
 * </p>
 * Path: org.tjhuey.manager.common.service.impl
 * <p>
 * Title: AdvertisementsServiceImpl.java
 * </p>
 * Company: resource.huey.org>
 * 
 * @author huey
 * @date 2017年3月31日
 * @version 1.0
 */
@Service
public class AdvertisementsServiceImpl implements AdvertisementsService {

	@Autowired
	private t_advertisementsMapper t_advertisementsMapper;

	@Override
	public List<t_advertisements> getAdvertisementsFront(Location location, int limit) {
		Map<String, Object> map = new HashMap<>();
		map.put("location", 2);
		map.put("limit", limit);
		return t_advertisementsMapper.queryAdvertisementFront(map);
	}

}
