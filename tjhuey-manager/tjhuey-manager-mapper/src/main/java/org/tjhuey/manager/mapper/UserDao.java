package org.tjhuey.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.tjhuey.manager.pojo.User;

/**
 * 用户的dao层接口
 * 
 * @author huey
 *
 */
public interface UserDao {

	/**
	 * 不同角色登录
	 * 
	 * @param map
	 * @return
	 */
	public User login(@Param("userName") String userName);

	/**
	 * 通过id查个人信息
	 * @param userId
	 * @return
	 */
	public User queryDetailById(@Param("userId") String userId);
	
	/**
	 * 添加会员信息
	 * 
	 * @param user
	 */
	public void save(User user);

	/**
	 * 获取所有的记录数
	 * 
	 * @return 记录数
	 */
	public int getCount(@Param("authority") Integer authority);

	/**
	 * 获取所有的会员信息
	 * 
	 * @return 会员列表
	 */
	public List<User> queryAllUser();

	/**
	 * 分页查询所有的会员信息
	 * 
	 * @param map
	 * @return
	 */
	public List<User> queryByPager(Map<String, Integer> map);

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

	/**修改积分
	 * @param user
	 */
	public void updateScore(User user);

	public void addScore(@Param("userId")int userId,@Param("resourceScore") Integer resourceScore);
}
