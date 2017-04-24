package org.tjhuey.manager.service.user.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.tjhuey.common.utils.Pager;
import org.tjhuey.common.utils.PagerUtil;
import org.tjhuey.manager.mapper.AddressDao;
import org.tjhuey.manager.mapper.UserDao;
import org.tjhuey.manager.pojo.Address;
import org.tjhuey.manager.pojo.User;
import org.tjhuey.manager.service.user.UserService;

@Transactional(rollbackFor = { Exception.class })
@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private AddressDao addressDao;

	@Override
	public User checkUser(String userName) {
		User user = userDao.login(userName);
		return user;
	}

	@Transactional(readOnly = true)
	@Override
	public User queryDetailById(String userId) {
		return userDao.queryDetailById(userId);
	}

	@Override
	public void save(User user,Address address) {
		addressDao.save(address);
		user.setAddress(address);
		userDao.save(user);
	}

	@Transactional(readOnly = true)
	@Override
	public int getCount(Integer authority) {
		return userDao.getCount(authority);
	}

	@Transactional(readOnly = true)
	@Override
	public List<User> queryAllUser() {
		return userDao.queryAllUser();
	}

	@Transactional(readOnly = true)
	@Override
	public List<User> queryByPager(Pager pager, Integer authority) {
		Map<String, Integer> map = PagerUtil.getAllInfo(pager);
		map.put("authority", authority);
		return userDao.queryByPager(map);
	}

	@Override
	public void deleteById(Integer userId) {
		userDao.deleteById(userId);
	}

	@Override
	public void update(User user, Address address) {
		addressDao.update(address);
		user.setAddress(address);// 目的是给id
		userDao.updateById(user);

	}

}
