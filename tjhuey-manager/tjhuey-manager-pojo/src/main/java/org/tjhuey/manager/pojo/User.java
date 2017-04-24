package org.tjhuey.manager.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体，对应不同角色(系统管理员,前端管理员,会员用户以及普通用户)
 * 
 * @author huey
 *
 */
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer userId;// id标识
	private String userName;// 用户名
	private String nickName;// 昵称
	private String password;// 密码
	private Integer sex; // 性别
	private String email;// email邮箱
	private String phoneNumber;// 手机号
	private Integer authority;// 权限标识
	private Address address;

	private Integer count = 0;// 签到次数//默认0
	private Integer score = 100;// 个人积分 //默认100
	private String imgPath = "static/images/1.jpg";// 头像图片路径
	private Date rigistTime = new Date();// 注册时间
	private Date lastTime = new Date();// 上次登录时间
	private Date loginTime = new Date();// 当前登录时间
	// private static int timeContro = 0;

	public User() {
		super();
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Integer getAuthority() {
		return authority;
	}

	public void setAuthority(Integer authority) {
		this.authority = authority;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public Date getRigistTime() {
		return rigistTime;
	}

	public void setRigistTime(Date rigistTime) {
		this.rigistTime = rigistTime;
	}

	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public User(Integer userId, String userName, String nickName, String password, Integer sex, String email,
			String phoneNumber, Integer authority, Address address, Integer count, Integer score, String imgPath,
			Date rigistTime, Date lastTime, Date loginTime) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.nickName = nickName;
		this.password = password;
		this.sex = sex;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.authority = authority;
		this.address = address;
		this.count = count;
		this.score = score;
		this.imgPath = imgPath;
		this.rigistTime = rigistTime;
		this.lastTime = lastTime;
		this.loginTime = loginTime;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", nickName=" + nickName + ", password=" + password
				+ ", sex=" + sex + ", email=" + email + ", phoneNumber=" + phoneNumber + ", authority=" + authority
				+ ", address=" + address + ", count=" + count + ", score=" + score + ", imgPath=" + imgPath
				+ ", rigistTime=" + rigistTime + ", lastTime=" + lastTime + ", loginTime=" + loginTime + "]";
	}

}
