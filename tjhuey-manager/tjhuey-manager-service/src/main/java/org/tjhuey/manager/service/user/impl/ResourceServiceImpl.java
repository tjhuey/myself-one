package org.tjhuey.manager.service.user.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.tjhuey.common.utils.Pager;
import org.tjhuey.common.utils.PagerUtil;
import org.tjhuey.manager.mapper.ResourceDao;
import org.tjhuey.manager.mapper.UserDao;
import org.tjhuey.manager.pojo.Resource;
import org.tjhuey.manager.pojo.User;
import org.tjhuey.manager.service.user.ResourceService;

@Transactional(rollbackFor = Exception.class)
@Service
public class ResourceServiceImpl implements ResourceService {

	@Autowired
	private ResourceDao resourceDao;
	@Autowired
	private UserDao userDao;

	@Override
	public void save(Resource resource) {
		userDao.updateScore(resource.getUser());
		resourceDao.save(resource);
	}

	@Override
	public int getCount() {
		return resourceDao.getCount();
	}

	@Override
	public List<Resource> queryByPager(Pager pager) {
		Map<String, Integer> map = PagerUtil.getAllInfo(pager);
		return resourceDao.queryByPager(map);
	}

	@Transactional
	@Override
	public void deleteById(Integer resourceId) {
		resourceDao.deleteById(resourceId);
	}

	@Override
	public Resource getDetail(Integer id) {
		
		return resourceDao.getDetailById(id);
	}

	@Override
	public List<Resource> queryByPager(Pager pager, Integer userId) {
		Map<String, Integer> map = PagerUtil.getAllInfo(pager);
		map.put("userId", userId);
		return resourceDao.queryByPager(map);
	}

	@Override
	public int getCount(Integer userId) {
		return resourceDao.getCountByUserId(userId);
	}

	@Override
	public void updateScore(User user) {
		userDao.updateScore(user);
	}

	@Override
	public void addScore(int userId, Integer resourceScore) {
		userDao.addScore(userId,resourceScore);
	}

}
