
package org.tjhuey.wechat.init.message.resp;

/**
 * 
 * <p>Description: </p>
 * Path: org.tjhuey.wechat.init.message.resp
 * <p>Title: TextMessage.java</p>
 * Company: resource.huey.org>
 * @author huey
 * @date 2017年3月30日
 * @version 1.0
 */
public class TextMessage extends BaseMessage {
	// 回复的消息内容
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}