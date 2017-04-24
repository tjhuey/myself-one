package org.tjhuey.manager.service.user;

import org.tjhuey.manager.pojo.t_supervisors;

import java.util.List;

/**
 * <p>
 * Description:
 * </p>
 * Path: org.tjhuey.manager.user.service.impl
 * <p>
 * Title: SupervisorService.java
 * </p>
 * Company: resource.huey.org>
 * 
 * @author huey
 * @date 2017年3月31日
 * @version 1.0
 */
public interface SupervisorService {

	public t_supervisors getById(Long id);
	
	public List<t_supervisors> getAll();

	public t_supervisors selectInfoByNameAndPwd(t_supervisors supervisor);
	
	
}
