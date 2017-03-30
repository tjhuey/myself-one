package org.tjhuey.wechat.init.message.req;


/**
 * <p>Description: </p>
 * Path: org.tjhuey.wechat.init.message.req
 * <p>Title: TextMessage.java</p>
 * Company: resource.huey.org>
 * @author huey
 * @date 2017年3月30日
 * @version 1.0
 */
public class TextMessage extends BaseMessage {
	// 消息内容
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}