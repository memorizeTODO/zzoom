package com.team5.zzoom.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class MeetingRoomController {
	
	@PostMapping("/joinMeetingRoom")
	public String test(@RequestBody HashMap<String, Object> map) {
		
		
		
		return "meetingroom";
	}
}
