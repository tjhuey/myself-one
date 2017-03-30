
package org.tjhuey.wechat.init.pojo;

/**
 * 
 * <p>Description: </p>
 * Path: org.tjhuey.wechat.init.pojo
 * <p>Title: ViewButton.java</p>
 * Company: resource.huey.org>
 * @author huey
 * @date 2017年3月30日
 * @version 1.0
 */
public class ViewButton extends Button {
	private String type;
	private String url;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}