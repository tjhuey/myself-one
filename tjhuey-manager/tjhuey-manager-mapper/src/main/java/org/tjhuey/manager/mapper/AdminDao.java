package org.tjhuey.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.tjhuey.manager.pojo.User;

/**
 * @author huey 管理员数据层操作
 */
public interface AdminDao {

	/**
	 * 添加管理员信息
	 * 
	 * @param user
	 */
	public void save(User user);

	/**
	 * 获取所有的记录数
	 * 
	 * @return 记录数
	 */
	public int getCount();

	/**
	 * 获取所有的系统管理员信息
	 * 
	 * @return 系统管理员列表
	 */
	public List<User> queryAllSystemAdmin();

	/**
	 * 分页查询所有的系统管理员信息
	 * 
	 * @param map
	 * @return
	 */
	public List<User> queryByPager(Map<String, Integer> map);

	/**
	 * 检验数据库中是否存在该用户
	 * 
	 * @param userName
	 * @return
	 */
	public User checkUserByUserName(@Param("userName") String userName);

	/**
	 * 通过id查询一个具体对象的详细信息
	 * 
	 * @param userId
	 *            id号
	 * @return
	 */
	public User queryAdminDetail(@Param("userId")Integer userId);

	/**
	 * 通过id进行修改
	 * @param user
	 */
	public void updateById(User user);
	
	/**
	 * 通过id删除信息
	 * @param userId
	 */
	public void deleteById(@Param("userId")Integer userId);

	/**
	 * 通过id修改上次登录时间
	 * @param user
	 */
	public void updateLastTime(User user);

}
