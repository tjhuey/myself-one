package org.tjhuey.wechat.init.message.req;

/**
 * <p>
 * Description:
 * </p>
 * Path: org.tjhuey.wechat.init.message.req
 * <p>
 * Title: VoiceMessage.java
 * </p>
 * Company: resource.huey.org>
 * 
 * @author huey
 * @date 2017年3月30日
 * @version 1.0
 */
public class VoiceMessage extends BaseMessage {
	// 媒体ID
	private String MediaId;
	// 语音格式
	private String Format;

	public String getMediaId() {
		return MediaId;
	}

	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}

	public String getFormat() {
		return Format;
	}

	public void setFormat(String format) {
		Format = format;
	}
}
