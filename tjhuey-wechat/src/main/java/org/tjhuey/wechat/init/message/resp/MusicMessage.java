package org.tjhuey.wechat.init.message.resp;  
  
/** 
 *  
 * <p>Description: </p>
 * Path: org.tjhuey.wechat.init.message.resp
 * <p>Title: MusicMessage.java</p>
 * Company: resource.huey.org>
 * @author huey
 * @date 2017年3月30日
 * @version 1.0
 */
public class MusicMessage extends BaseMessage {  
    // 音乐  
    private Music Music;  
  
    public Music getMusic() {  
        return Music;  
    }  
  
    public void setMusic(Music music) {  
        Music = music;  
    }  
}