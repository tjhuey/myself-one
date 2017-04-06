
package org.tjhuey.manager.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tjhuey.manager.mapper.t_supervisorsMapper;
import org.tjhuey.manager.pojo.t_supervisors;
import org.tjhuey.manager.user.service.SupervisorService;

/**
 * <p>Description: </p>
 * Path: org.tjhuey.manager.user.service.impl
 * <p>Title: SupervisorServiceImpl.java</p>
 * Company: resource.huey.org>
 * @author huey
 * @date 2017年3月31日
 * @version 1.0
 */
@Service
public class SupervisorServiceImpl implements SupervisorService{

	@Autowired
	private t_supervisorsMapper t_supervisorsMapper;
	
	@Override
	public  t_supervisors getById(Long id) {
		return t_supervisorsMapper.selectByPrimaryKey(id);
		
	}

	@Override
	public List<t_supervisors> getAll() {
		return t_supervisorsMapper.getAll();
	}

}
