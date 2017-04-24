package org.tjhuey.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.tjhuey.manager.pojo.Resource;

/**
 * 资源dao层
 * 
 * @author huey
 *
 */
public interface ResourceDao {

	/**
	 * 保存个人资源
	 * 
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
	public List<Resource> queryByPager(Map<String, Integer> map);
	
	/**
	 * 通过id删除
	 * @param resourceId
	 */
	public void deleteById(@Param("id") Integer resourceId);

	/**
	 * 通过id查询资源详情
	 * @param resourceId 
	 * @return
	 */
	public Resource getDetailById(@Param("id") Integer resourceId);

	public int getCountByUserId(Integer userId);


}
