package com.core.scheduler;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.core.controller.CoreController;
import com.core.service.DeptService;

@Component("cronTask")
public class Scheduler extends CoreController{

	@Inject
	private DeptService service;
	
	@Scheduled(cron="0 0 0 ? * MON")
	public void orgChartScheduler() {
		try {
			service.selOrgChartDownload();
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
		}
	}
	
	@Scheduled(cron="* * * * * *")
	public void orgChartScheduler1() {
		try {
			service.selOrgChartDownload();
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
		}
	}
	
}
