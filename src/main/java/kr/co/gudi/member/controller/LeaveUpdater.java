package kr.co.gudi.member.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import kr.co.gudi.member.service.MemberService;

@EnableScheduling
@Controller
public class LeaveUpdater {
	    private final MemberService service;

	    @Autowired
	    public LeaveUpdater(MemberService service) {
	        this.service = service;
	    }

	    @Scheduled(cron = "0 0 6 * * *") 
	    public void updateLeave() {
	    	LocalDate currentDate = LocalDate.now();
	    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd");
	    	String formattedDate = currentDate.format(formatter);
	        service.updateLeave(formattedDate);
	    }
	    
	   
	}

