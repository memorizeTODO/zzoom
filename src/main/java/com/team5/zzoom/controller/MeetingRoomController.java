package com.team5.zzoom.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team5.zzoom.model.MemberDTO;

@Controller
public class MeetingRoomController {

	@RequestMapping("/meetingroom")
	public String test(Model model) {
		
		return "meetingroom";
	}
	
	@GetMapping("get/memberList")
	public Map<String,List<MemberDTO>> getMeetingRoomMemberList(@RequestParam("room_id") String roomID) {
		
		
		
		return null;
	}
}

