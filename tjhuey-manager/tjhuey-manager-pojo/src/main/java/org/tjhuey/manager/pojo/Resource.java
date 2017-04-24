package org.tjhuey.manager.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 资源信息
 * 
 * @author huey
 *
 */
public class Resource implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer resourceId;
	private String name;// 资源名称
	private String detail;// 资源详情
	private String language;// 方向 比如c 还是java 还是Android
	private int type;// 类型 电子书 视频 还是其他工具。
	private Integer size;// 后期除8 byte
	private Date uploadTime;// 上传时间
	private Integer score;// 积分
	private String path;// 路径
	private User user;// 个人

	public Resource() {
		super();
	}

	public Resource(Integer resourceId, String name, String detail, String language, int type, Integer size,
			Date uploadTime, Integer score, String path, User user) {
		super();
		this.resourceId = resourceId;
		this.name = name;
		this.detail = detail;
		this.language = language;
		this.type = type;
		this.size = size;
		this.uploadTime = uploadTime;
		this.score = score;
		this.path = path;
		this.user = user;
	}

	public Integer getResourceId() {
		return resourceId;
	}

	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getPath() {
		//this.path.lastIndexOf("/");
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Resource [resourceId=" + resourceId + ", name=" + name + ", detail=" + detail + ", language=" + language
				+ ", type=" + type + ", size=" + size + ", uploadTime=" + uploadTime + ", score=" + score + ", path="
				+ path + ", user=" + user + "]";
	}

}
