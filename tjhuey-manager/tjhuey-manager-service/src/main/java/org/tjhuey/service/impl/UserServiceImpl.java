package org.tjhuey.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tjhuey.mapper.UserMapper;
import org.tjhuey.pojo.User;
import org.tjhuey.service.UserService;

/**
 * <p>
 * Description:
 * </p>
 * Path: org.tjhuey.service.impl
 * <p>
 * Title: UserServiceImpl.java
 * </p>
 * Company: resource.huey.org>
 * 
 * @author huey
 * @date 2017年3月29日
 * @version 1.0
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public User getUserById(Integer userId) {

		return userMapper.selectByPrimaryKey(userId);
	}

}
