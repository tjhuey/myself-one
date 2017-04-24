package org.tjhuey.manager.service.user;

import java.util.List;

import org.tjhuey.common.utils.Pager;
import org.tjhuey.manager.pojo.Address;
import org.tjhuey.manager.pojo.User;

public interface AdminService {

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
	 * 添加管理员信息
	 * 
	 * @param user
	 * @param address 
	 */
	public void save(User user, Address address);

	/**
	 * 分页查询所有的系统管理员
	 * 
	 * @param pager
	 * @return
	 */
	public List<User> queryByPager(Pager pager);

	/**
	 * 插入时通过userName检验数据库是否存在改用户
	 * 
	 * @param userName
	 * @return
	 */
	public User checkUserByUserName(String userName);

	/**
	 * 通过id查询一个具体对象的详细信息
	 * 
	 * @param userId
	 *            id号
	 * @return
	 */
	public User queryAdminById(Integer userId);


	/**
	 * 通过id修改系统管理员
	 * @param user
	 * @param address
	 */
	public void update(User user, Address address);

	/**删除系统管理员
	 * @param userId
	 */
	public void delete(Integer userId);

	/**为了修改上次登录时间
	 * @param user
	 */
	public void update(User user);

}
