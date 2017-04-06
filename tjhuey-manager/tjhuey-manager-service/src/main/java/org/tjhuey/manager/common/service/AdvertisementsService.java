package org.tjhuey.manager.common.service;

import java.util.List;

import org.tjhuey.common.utils.AdvertisementUtil.Location;
import org.tjhuey.manager.pojo.t_advertisements;

/**
 * <p>
 * Description: 广告业务
 * </p>
 * Path: t_advertisements
 * <p>
 * Title: AdvertisementsService.java
 * </p>
 * Company: resource.huey.org>
 * 
 * @author huey
 * @date 2017年3月31日
 * @version 1.0
 */
public interface AdvertisementsService {

	public List<t_advertisements> getAdvertisementsFront(Location location,int limit);
}
