package org.tjhuey.manager.service.user.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.tjhuey.common.utils.Pager;
import org.tjhuey.common.utils.PagerUtil;
import org.tjhuey.manager.mapper.AddressDao;
import org.tjhuey.manager.mapper.AdminDao;
import org.tjhuey.manager.pojo.Address;
import org.tjhuey.manager.pojo.User;
import org.tjhuey.manager.service.user.AdminService;

/**
 * 管理员业务操作
 * @author huey
 *
 */
@Transactional(rollbackFor={Exception.class})
@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	@Autowired
	private AddressDao addressDao;

	@Transactional(readOnly=true)
	@Override
	public int getCount() {
		return adminDao.getCount();
	}

	@Transactional(readOnly=true)
	@Override
	public List<User> queryAllSystemAdmin() {
		return adminDao.queryAllSystemAdmin();
	}

	@Override
	public void save(User user, Address address) {
		addressDao.save(address);
		user.setAddress(address);
		adminDao.save(user);
	}

	@Transactional(readOnly=true)
	@Override
	public List<User> queryByPager(Pager pager) {
		Map<String, Integer> map = PagerUtil.getAllInfo(pager);
		return adminDao.queryByPager(map);
	}

	@Transactional(readOnly=true)
	@Override
	public User checkUserByUserName(String userName) {

		return adminDao.checkUserByUserName(userName);
	}

	@Transactional(readOnly=true)
	@Override
	public User queryAdminById(Integer userId) {

		return adminDao.queryAdminDetail(userId);
	}

	@Override
	public void update(User user, Address address) {
			
		addressDao.update(address);
		if (address !=null) {
			user.setAddress(address);//目的是给id
		}
		adminDao.updateById(user);
	}

	public void delete(Integer userId) {
		adminDao.deleteById(userId);
	}

	@Override
	public void update(User user) {
		adminDao.updateLastTime(user);
	}
}
