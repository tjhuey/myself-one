package org.tjhuey.manager.pojo;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer commentId;
	private String title;
	private String content;
	private Date postTime = new Date();
 
	private User user;
	private Resource resource;

	public Comment() {
	}

	public Comment(Integer commentId, String title, String content, Date postTime, User user, Resource resource) {
		super();
		this.commentId = commentId;
		this.title = title;
		this.content = content;
		this.postTime = postTime;
		this.user = user;
		this.resource = resource;
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPostTime() {
		return postTime;
	}

	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", title=" + title + ", content=" + content + ", postTime="
				+ postTime + ", user=" + user + ", resource=" + resource + "]";
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

}
