package org.tjhuey.wechat.init.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 * <p>Description: </p>
 * Path: org.tjhuey.wechat.init.quartz
 * <p>Title: WeiXinQuartzJob.java</p>
 * Company: resource.huey.org>
 * @author huey
 * @date 2017年3月30日
 * @version 1.0
 */
public class WeiXinQuartzJob extends QuartzJobBean {

	private WeChatTestTask weChatTestTask;

	public void setWeChatTestTask(WeChatTestTask weChatTestTask) {
		this.weChatTestTask = weChatTestTask;
	}
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		weChatTestTask.sendInfo();
	}

}
