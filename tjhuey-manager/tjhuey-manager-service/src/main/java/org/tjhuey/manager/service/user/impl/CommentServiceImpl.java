package org.tjhuey.manager.service.user.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.tjhuey.common.utils.Pager;
import org.tjhuey.common.utils.PagerUtil;
import org.tjhuey.manager.mapper.CommentDao;
import org.tjhuey.manager.pojo.Comment;
import org.tjhuey.manager.service.user.CommentService;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDao commentDao;
	@Override
	public void save(Comment comment) {
		commentDao.save(comment);
	}

	@Override
	public int getCount(Integer resourceId) {
		return commentDao.getCount(resourceId);
	}

	@Override
	public List<Comment> queryByPager(Pager pager,Integer resourceId) {
		Map<String, Integer> map = PagerUtil.getAllInfo(pager);
		map.put("resourceId", resourceId);
		return commentDao.queryByPager(map);
	}

	@Transactional
	@Override
	public void deleteById(Integer commentId) {
	//	commentDao.updateForeignKeyForDelete(commentId);
		commentDao.deleteById(commentId);
	}

	@Override
	public Comment getDetail(Integer id) {
		
		return commentDao.getDetailById(id);
	}

}
