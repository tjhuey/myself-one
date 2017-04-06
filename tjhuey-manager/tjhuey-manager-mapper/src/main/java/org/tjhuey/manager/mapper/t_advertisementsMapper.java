package org.tjhuey.manager.mapper;

import java.util.List;
import java.util.Map;

import org.tjhuey.manager.pojo.t_advertisements;

public interface t_advertisementsMapper {
	int deleteByPrimaryKey(Long id);

	int insert(t_advertisements record);

	int insertSelective(t_advertisements record);

	t_advertisements selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(t_advertisements record);

	int updateByPrimaryKey(t_advertisements record);

	/**
	 * <p>
	 * Description: 
	 * </p>
	 * 
	 * @author huey
	 * @date 2017年3月31日
	 */
	public List<t_advertisements> queryAdvertisementFront(Map<String, Object> map);
}