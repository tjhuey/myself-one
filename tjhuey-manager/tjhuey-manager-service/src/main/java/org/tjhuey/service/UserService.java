package org.tjhuey.service;

import org.tjhuey.pojo.User;

/**
 * <p>Description: </p>
 * Path: org.tjhuey.service
 * <p>Title: UserService.java</p>
 * Company: resource.huey.org>
 * @author huey
 * @date 2017年3月29日
 * @version 1.0
 */
public interface UserService {
  
	public User getUserById(Integer userId);
}
