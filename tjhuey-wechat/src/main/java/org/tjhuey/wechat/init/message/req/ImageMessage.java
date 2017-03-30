package org.tjhuey.wechat.init.message.req;


/**
 * <p>Description: </p>
 * Path: org.tjhuey.wechat.init.message.req
 * <p>Title: ImageMessage.java</p>
 * Company: resource.huey.org>
 * @author huey
 * @date 2017年3月30日
 * @version 1.0
 */
public class ImageMessage extends BaseMessage {
	// 图片链接
	private String PicUrl;

	public String getPicUrl() {
		return PicUrl;
	}

	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
}

