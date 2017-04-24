package org.tjhuey.manager.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * 个人资源列表
 * 
 * @author huey
 *
 */
public class Resources implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer resourcesId;
	private Integer totalNum;// 个人资源统计个数
	private Integer totalSize;// 个人资源统计大小
	private Integer totalScore;// 个人统计分数
	private List<Resource> resources;// 个人资源列表
	private User user;// 个人用户

	public Resources() {
		super();
	}

	public List<Resource> getResources() {
		return resources;
	}

	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}

	public Integer getResourcesId() {
		return resourcesId;
	}

	public void setResourcesId(Integer resourcesId) {
		this.resourcesId = resourcesId;
	}

	public Integer getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(Integer totalNum) {
		this.totalNum = totalNum;
	}

	public Integer getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(Integer totalSize) {
		this.totalSize = totalSize;
	}

	public Integer getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Resources(Integer resourcesId, Integer totalNum, Integer totalSize, Integer totalScore,
			List<Resource> resources, User user) {
		super();
		this.resourcesId = resourcesId;
		this.totalNum = totalNum;
		this.totalSize = totalSize;
		this.totalScore = totalScore;
		this.resources = resources;
		this.user = user;
	}
	@Override
	public String toString() {
		return "Resources [resourcesId=" + resourcesId + ", totalNum=" + totalNum + ", totalSize=" + totalSize
				+ ", totalScore=" + totalScore + ", resources=" + resources + ", user=" + user + "]";
	}

}
