package org.tjhuey.manager.mapper;

import org.apache.ibatis.annotations.Param;
import org.tjhuey.manager.pojo.Address;

/**
 * 地址数据访问层
 * @author huey
 *
 */
public interface AddressDao {
	
	/**通过非id查询id
	 * @param address
	 * @return
	 */
//	public Address getAddressByNoId(Address address); 
	/**
	 * 通过id获取该Address
	 * @param id
	 * @return
	 */
	public Address getAddressById(@Param("id")Integer id);
	
	/**
	 * 插入地址操作
	 * @param address
	 * @return
	 */
	public void save(Address address);
	
	/**
	 * 通过id修改信息
	 * @param address
	 */
	public void update(Address address);

	
	
	
}
