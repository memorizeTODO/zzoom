package com.team5.zzoom.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.team5.zzoom.model.MemberDTO;
import com.team5.zzoom.service.MeetingRoomDAOImpl;
import com.team5.zzoom.service.MemberDAOImpl;

import jakarta.servlet.http.HttpSession;

@Controller
public class MeetingRoomController {
	@Autowired
	private MeetingRoomDAOImpl meetingRoomService;
	@Autowired
	private MemberDAOImpl memberService;

	@RequestMapping("/meetingroom")
	public String test(Model model) {
		
		return "meetingroom";
	}
	
	
	@PutMapping("/put/MemberNowRoomState")
	public void updateMemberNowRoomState(HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("member_id");
		
		
		
		// 수정 결과 가져오기
		MemberDTO member = memberService.myPage(member_id);
		
	}
	
	
	@ResponseBody
	@GetMapping("get/memberList")
	public ResponseEntity<Map<String,List<MemberDTO>>> getMeetingRoomMemberList(@RequestParam("roomNum") String roomNum) {
		
		Map<String,List<MemberDTO>> returnMap = new HashMap<String,List<MemberDTO>>();
		List<MemberDTO> memberList= null; 
		
		
		memberList = meetingRoomService.getMemberList(Integer.parseInt(roomNum));
		returnMap.put("memberList", memberList);
		
		
		
		
		return ResponseEntity.ok(returnMap);
	}
}

