package org.tjhuey.manager.service.trigger.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class TriggerServiceImpl {

	Logger logger = LoggerFactory.getLogger(TriggerServiceImpl.class);
	@Autowired
	private CreateExcelServiceImpl createExcelServiceImpl;

	public void doIt() {
		logger.info("创建excel开始");
		try {
			String fileName = createExcelServiceImpl.createExcel();
			logger.info("创建" + fileName + "结束");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
