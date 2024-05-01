package com.team5.zzoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team5.zzoom.service.AdminMeetingService;

@Controller
public class AdminMeetingController {
	
	@Autowired
	private AdminMeetingService service;
	
	// 회의목록
	@RequestMapping("meetinglist")
	public String meetinglist() {

		return "meeting/meetinglist";
	}
}
