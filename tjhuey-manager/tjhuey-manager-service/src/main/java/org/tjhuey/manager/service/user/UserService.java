package org.tjhuey.manager.service.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.tjhuey.common.utils.Pager;
import org.tjhuey.manager.pojo.Address;
import org.tjhuey.manager.pojo.User;

/**
 * 用户业务层操作
 * @author huey
 *
 */
public interface UserService {

	public User checkUser(String userName);
	
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
	public void save(User user,Address address);

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
	public List<User> queryByPager(Pager pager,Integer authority);

	/**
	 * 通过id修改会员
	 * @param user
	 * @param address
	 */
	public void update(User user, Address address);
	
	/**
	 * 通过id删除信息
	 * @param userId
	 */
	public void deleteById(@Param("userId")Integer userId);
	
	
}
