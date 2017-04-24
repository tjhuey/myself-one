package org.tjhuey.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.tjhuey.manager.pojo.Comment;

public interface CommentDao {

	void save(Comment comment);

	int getCount(@Param("resourceId")Integer resourceId);

	List<Comment> queryByPager(Map<String, Integer> map);

	void deleteById(Integer commentId);

	Comment getDetailById(Integer id);
	
	void updateForeignKeyForDelete(Integer commentId);

}
