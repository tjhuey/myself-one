package org.tjhuey.manager.service.utils.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.tjhuey.manager.pojo.t_supervisors;
import org.tjhuey.manager.service.user.SupervisorService;

/**
 * <p>
 * Description:
 * </p>
 * Path: org.tjhuey.manager.service.utils
 * <p>
 * Title: JFRealm.java
 * </p>
 * Company: resource.huey.org
 * 
 * @author huey
 * @date 2017年4月19日
 * @version 1.0
 */
public class JFRealm extends AuthorizingRealm {

	@Autowired
	private SupervisorService supervisorService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;

		// 用户密码的加密和盐值处理
		Object username = usernamePasswordToken.getPrincipal();
		// 数据模型对比准备
		t_supervisors supervisor = new t_supervisors();
		supervisor.setName((String) username);
		// 数据模型处理
		t_supervisors result = supervisorService.selectInfoByNameAndPwd(supervisor);

		if (result == null) {
			return null;
		} else {

			// 注意放的是对象t_supervisors
			ByteSource salt = ByteSource.Util.bytes(username);
			SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(result,
					result.getPassword(), salt, getName());
			return simpleAuthenticationInfo;
		}
	}

	public static void main(String[] args) {
		String algorithmName = "MD5";
		Object source = "123456";
		ByteSource salt = ByteSource.Util.bytes("supervisor");
		int iterations = 1024;
		SimpleHash simpleHash = new SimpleHash(algorithmName, source, salt,
				iterations);
		System.out.println(simpleHash);
	}
}
