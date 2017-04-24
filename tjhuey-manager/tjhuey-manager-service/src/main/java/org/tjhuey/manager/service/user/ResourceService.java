package org.tjhuey.manager.service.user;

import java.util.List;

import org.tjhuey.common.utils.Pager;
import org.tjhuey.manager.pojo.Resource;
import org.tjhuey.manager.pojo.User;

/**
 * 资源业务操作
 * @author huey
 *
 */
public interface ResourceService {
	
	/**
	 * 获取详情
	 * @return
	 */
	public Resource getDetail(Integer id);
	/**保存个人资源
	 * @param resource
	 */
	public void save(Resource resource);

	/**
	 * 获取所有的记录数
	 * 
	 * @return 记录数
	 */

	public int getCount();

	/**
	 * 分页查询所有记录
	 * 
	 * @param map
	 * @return
	 */
	/**
	 * 分页查询所有的系统管理员
	 * 
	 * @param pager
	 * @return
	 */
	public List<Resource> queryByPager(Pager pager);
	
	/**
	 * 通过id删除
	 * @param resourceId
	 */
	public void deleteById(Integer resourceId);
	public List<Resource> queryByPager(Pager pager, Integer userId);
	public int getCount(Integer userId);
	public void updateScore(User user);
	public void addScore(int userId, Integer resourceScore);
}
