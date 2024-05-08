package com.team5.zzoom.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.apache.commons.beanutils.BeanUtils;
import org.json.JSONObject;

import java.util.Map;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team5.zzoom.model.MeetingRoomDTO;
import com.team5.zzoom.model.MemberDTOExt;
import com.team5.zzoom.model.MemberDTO;
import com.team5.zzoom.model.ReservationDTO;
import com.team5.zzoom.service.MeetingRoomDAOImpl;
import com.team5.zzoom.service.MemberDAOImpl;

import jakarta.servlet.http.HttpSession;

@Controller
public class MeetingRoomController {
	@Autowired
	private MeetingRoomDAOImpl meetingRoomService;
	@Autowired
	private MemberDAOImpl memberService;

	/*
	 * @RequestMapping("meetingroom") public String test(Model model) {
	 * 
	 * return "meetingroom"; }
	 */
	
	@RequestMapping("testMeeting")
	public String test1(Model model) {
		
		return "testMeeting";
	}
	
	@RequestMapping("test3")
	public String test3(HttpSession session,Model model){
		
		return "test3";
	}
	@PostMapping("/put/keepAlive")
	public ResponseEntity<String> updateKeepAlive(HttpSession session,@RequestBody HashMap<String,Object> body) {
		System.out.println("request keepAlive");
		String member_id=(String)body.get("member_id"); //
		
		Timestamp now= null;
		
		if (!member_id.equals( (String) session.getAttribute("member_id")) ) {
			meetingRoomService.updateKeepAlive(member_id, now); //현재 세션의 멤버 id와 뷰쪽에서 요청인자로 온 멤버 id가 불일치시 요청인자에 해당되는 레코드의 keepalive컬럼의 엔티티에 null값을 부여하여 연결 해제시킴
			return ResponseEntity.status(401).body("Authorization failed") ;
		}
		
		int result = 0;
		
		now = new Timestamp(System.currentTimeMillis()); // 현재시간
		/*
		 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); Date
		 * formattedDate=sdf.format(date);
		 */
		result=meetingRoomService.updateKeepAlive(member_id, now);
		if(result==1) {
			return ResponseEntity.ok("updating your keepAlive is succeded.");
		}
		
		
		return ResponseEntity.status(400).body("updating your keepAlive is failed.");
	}
	
	@ResponseBody
	@GetMapping("/get/checkMyNowRoomState")
	public ResponseEntity<HashMap<String,Object>> getMemberNowRoomState(HttpSession session, Model model, @RequestParam HashMap<String,Object> params ){
		String member_id = (String) session.getAttribute("member_id");
		String roomNum = (String)params.get("room_num");
		
		HashMap<String,Object> response = new HashMap<String,Object>();
		
		int result = 0;
		String myNowRoomCode = null;
		
		//디폴트 리턴 값 세팅
		response.put("response", "" );
		response.put("log", "Something caused an error" );
		
		// 수정하기 
		if (!member_id.equals( (String) session.getAttribute("member_id")) ) {
			response.put("response", "" );
			response.put("log", "Authorization failed" );
			return ResponseEntity.ok(response);
		}
		
		myNowRoomCode = meetingRoomService.getMyNowRoomState(member_id); // 현재 이 작업을 요청한 멤버의 member_nowroom_code 값 가져오기
		if (myNowRoomCode == null || myNowRoomCode.equals("")) {
			response.put("response", -1 );
			response.put("log", "You have not entered the same room multiple times or entered this room while in another room. success" );
			
		}else {
			response.put("response", myNowRoomCode );
			response.put("log", "You have entered the same room multiple times or entered this room while in another room. fail" );
			
		}
		
		
		return ResponseEntity.ok(response);
	}
	
	@ResponseBody
	@PostMapping("/put/myNowRoomState")
	public ResponseEntity<String> updateMemberNowRoomState(HttpSession session, Model model, @RequestBody HashMap<String,Object> body) {
		String member_id = (String) session.getAttribute("member_id");
		String roomNum = (String)body.get("room_num");
		int result = 0;
		// 수정하기 
		if (!member_id.equals( (String) session.getAttribute("member_id")) ) {
			return ResponseEntity.status(401).body("Authorization failed") ;
		}
		
		System.out.println(member_id+" "+roomNum);
		Timestamp now = null;
		if (body.get("purpose").equals("join") ) {
			//result = meetingRoomService.updateMeetingNowNumPlus(Integer.parseInt(roomNum)); //미팅룸에 참가자수+1
			result = meetingRoomService.updateMyNowRoomState(member_id,roomNum); // 현재 이 작업을 요청한 멤버의 member_nowroom_code 값 변경
			result = meetingRoomService.updateMeetingNowNum(Integer.parseInt(roomNum), roomNum); //현재 방에있는 참가자 수 갱신
			now= new Timestamp(System.currentTimeMillis());
			meetingRoomService.updateKeepAlive(member_id, now);
			
		} else if (body.get("purpose").equals("left") ) {
			//result = meetingRoomService.updateMeetingNowNumMinus(Integer.parseInt(roomNum)); //미팅룸에 참가자수-1
			result = meetingRoomService.updateMyNowRoomState(member_id,null); // 현재 이 작업을 요청한 멤버의 member_nowroom_code 값 변경
			result = meetingRoomService.updateMeetingNowNum(Integer.parseInt(roomNum), roomNum); //현재 방에있는 참가자 수 갱신
			now= new Timestamp(System.currentTimeMillis());
			meetingRoomService.updateKeepAlive(member_id, null);
		}
		
		MeetingRoomDTO metingRoomDTO = meetingRoomService.getMeetingRoom(Integer.parseInt(roomNum)); // 방 정보 가져옴
		
		if(metingRoomDTO!=null) {
			if(metingRoomDTO.getMeeting_member_num() == metingRoomDTO.getMeeting_member_nownum() ) { // 현재 인원이 방 최대 입장 인원이랑 같으면
				result = meetingRoomService.updateMeetingRoomJoin(Integer.parseInt(roomNum), -1); 
				
			}else if(metingRoomDTO.getMeeting_member_num() > metingRoomDTO.getMeeting_member_nownum()) {// 현재 인원이 방 최대 입장 인원보다 적으면
				result = meetingRoomService.updateMeetingRoomJoin(Integer.parseInt(roomNum), 1);
			}
		}else {
			result = 0;
		}
		
		
		
		
		// 수정 결과 가져오기
		MemberDTO member = memberService.myPage(member_id);
		System.out.println(member);
		if (member==null || result == 0) {
			return ResponseEntity.ok("SQL STATEMENT RETURNED FAIL.");
		}
		
		return ResponseEntity.ok("Entering MeetingRoom successfully.");
	}
	
	
	@ResponseBody
	@GetMapping("/get/memberList")
	public ResponseEntity<Map<String,List<MemberDTO>>> getMeetingRoomMemberList(@RequestParam("room_num") String roomNum) {
		System.out.println("멤버 리스트 요청 들어옴");
		Map<String,List<MemberDTO>> returnMap = new HashMap<String,List<MemberDTO>>();
		List<MemberDTO> memberList= null; 
		
		
		memberList = meetingRoomService.getMemberList(Integer.parseInt(roomNum));
		for (MemberDTO member : memberList) {
			System.out.println(member);
		}
		returnMap.put("memberList", memberList);
		
		
		
		
		return ResponseEntity.ok(returnMap);
	}
	
	@ResponseBody
	@GetMapping("/get/checkMeetingRoomFull")
	public String checkMeetingRoomFull(@RequestParam HashMap<String,String> params) {
		int returnVal = 1;
		
		int roomNum = Integer.parseInt(params.get("room_num"));
		System.out.println("checkMeetingRoomFull : "+roomNum);
		
		returnVal = meetingRoomService.getMeetingJoin(roomNum); //참여 가능 여부 값을 가져온다
		
		
		System.out.println("SQL returns : "+ returnVal);
		
		return Integer.toString(returnVal); 
	}
	
	@PostMapping("/put/updateMeetingRoomJoin")
	public String updateMeetingRoomJoin(@RequestParam HashMap<String,String> params) {
		String returnVal = "1";
		
		int roomNum = Integer.parseInt(params.get("room_num"));
		int meetingMemberNowNum = Integer.parseInt(params.get("participants_num"));
		
		return null; 
	}
	
	
	@PostMapping("joinMeetingRoom")
	public String joinMeetingRoom(@RequestBody String parameter, HttpSession session, Model model ) {
	    // DTO를 DAO에 전달하여 데이터베이스에 삽입
		JSONObject roomData= new JSONObject(parameter); 
		
		String roomNum= Integer.toString(roomData.getInt("meeting_room_num"));
		String roomID = roomData.getString("meeting_id");
		
		String myID = (String) session.getAttribute("member_id");
		model.addAttribute("nowroom_num",Integer.parseInt(parameter));
		
	    System.out.println(parameter);
	 
	    return "meetingroom";

	}
	
	
	@GetMapping("joinMeetingRoom2")
	public String joinMeetingRoom2(@RequestParam("room_num")String roomNum , HttpSession session, Model model ) {
	    // DTO를 DAO에 전달하여 데이터베이스에 삽입
		String myID = (String) session.getAttribute("member_id");
		
		model.addAttribute("myID", myID);
		model.addAttribute("nowroom_num",Integer.parseInt(roomNum));
		
	    System.out.println(roomNum);
	 
	    return "meetingroom";

	}
	
	@RequestMapping(value = "member_login2", method = RequestMethod.POST)
	public String member_login(@ModelAttribute MemberDTOExt member, HttpSession session, Model model) {
		System.out.println("Access Login function");
		int result = 0;
		System.out.println(member);
		MemberDTO mem = memberService.memberCheck((MemberDTO)member);
		System.out.println("로그인 mem:" + mem);

		if (mem != null) {
			result = 1;

			session.setAttribute("member_id", member.getMember_id());
			return "redirect:/joinMeetingRoom2?room_num="+member.getRoom_num();
		} else {
			result = -1;

			return "redirect:/login";
		}

	}
	
	@GetMapping("get/nowRoomInfo")
	public ResponseEntity<Map<String,Object>> getNowRoomInfo(@RequestParam("room_num") int roomNum) {
		
		Map<String,Object> returnMap = null;
		//returnMap = new HashMap<String,Object>();
		//BeanUtils.populate(campingMap, BeanUtils.describe(campingList.get(i)));
		MeetingRoomDTO meetingRoomDTO = null;
		meetingRoomDTO = meetingRoomService.getMeetingRoom(roomNum);
		
		if(meetingRoomDTO!=null) {
			returnMap = new HashMap<String,Object>();
			returnMap.put("topic", meetingRoomDTO.getMeeting_topic());
			returnMap.put("representative", meetingRoomDTO.getMember_id()); //개설자겸 대표자
			returnMap.put("participants_now_num", meetingRoomDTO.getMeeting_member_nownum()); // 현재 수용된 인원 수
			returnMap.put("participants_max_num", meetingRoomDTO.getMeeting_member_num()); // 최대 수용가능 인원 수
			returnMap.put("is_joinable", meetingRoomDTO.getMeeting_join()); // 입장여부 (-1 입장불가 1 입장가능)
			
			
		}
		
		return ResponseEntity.ok(returnMap);
	}
	
	@GetMapping("get/myInfo") //다른 정보도 가져오고 싶지만 마감이 급한관계로 이름만 가져온다
	public ResponseEntity<String> getMyInfo(@RequestParam("member_id") String memberID){
		MemberDTO memberDTO = null;
		memberDTO = memberService.myPage(memberID); 
		if(memberDTO== null) {
			ResponseEntity.status(400).body("not found "+ memberID+"'s name");
		}
		
		return ResponseEntity.ok(memberDTO.getMember_name());
	}
	
}

