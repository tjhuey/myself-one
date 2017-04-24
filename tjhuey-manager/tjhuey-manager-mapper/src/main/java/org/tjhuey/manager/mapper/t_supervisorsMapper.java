package org.tjhuey.manager.mapper;

import java.util.List;

import org.tjhuey.manager.pojo.t_supervisors;

public interface t_supervisorsMapper {
    int deleteByPrimaryKey(Long id);

    int insert(t_supervisors record);

    int insertSelective(t_supervisors record);

    t_supervisors selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(t_supervisors record);

    int updateByPrimaryKey(t_supervisors record);

	List<t_supervisors> getAll();

	t_supervisors selectInfoByNameAndPwd(t_supervisors supervisor);
}