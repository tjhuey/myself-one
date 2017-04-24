package org.tjhuey.manager.service.user;

import java.util.List;

import org.tjhuey.common.utils.Pager;
import org.tjhuey.manager.pojo.Comment;

public interface CommentService {

	int getCount(Integer resourceId);

	List<Comment> queryByPager(Pager pager, Integer resourceId);

	void save(Comment comment);

	void deleteById(Integer commentId);

	Comment getDetail(Integer id);

}
