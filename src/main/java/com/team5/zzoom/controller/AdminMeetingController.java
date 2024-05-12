package com.team5.zzoom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team5.zzoom.model.AdminMeeting;
import com.team5.zzoom.model.AdminNotice;
import com.team5.zzoom.service.AdminMeetingService;

@Controller
public class AdminMeetingController {
	
	@Autowired
	private AdminMeetingService service;
	
	// 회의목록
		@RequestMapping("admin/meetinglist")
		public String memberlist(@RequestParam(value="page",defaultValue = "1") int page,  Model model) {
			
			int limit = 10;
			
			int listcount = service.getCount();
			System.out.println("listcount:"+ listcount);
			
			int start = (page - 1) * limit;   // limit  start , 10
			
			List<AdminMeeting> meetinglist = service.getMeetinglist(start);
			System.out.println("meetinglist:"+ meetinglist);
			
			// 총페이지
			int pageCount = listcount/limit+((listcount%10==0)?0:1);
			
			int startPage = ((page-1)/10) * limit + 1;	// 1, 11, 21...
			int endPage = startPage + 10 - 1;			//10, 20, 30...
			
			if(endPage > pageCount)
				endPage = pageCount;
			
			model.addAttribute("page", page);
			model.addAttribute("listcount", listcount);
			model.addAttribute("meetinglist", meetinglist);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);		
			

			return "meeting/meetinglist";
		}
		
		//회의 수정폼
		@RequestMapping("admin/meetingupdateform")
		public String memberupdate(@RequestParam("meeting_room_num") String meeting_room_num, 
								   @RequestParam("meeting_id") String meeting_id, 
								   @RequestParam("page") int page, Model model) {
			System.out.println("meeting_room_num:"+ meeting_room_num);
			System.out.println("meeting_id:"+ meeting_id);
			
			AdminMeeting meeting = service.getMeeting(meeting_id);
			
			int result = 0;
			//result = service.update(meeting_id);
			
			model.addAttribute("meeting", meeting);
			model.addAttribute("page", page);
			
			return "meeting/updateform";
		}
		
		//회의정보 수정
		@RequestMapping("admin/meetingupdate")
		public String noticeupdate(@ModelAttribute AdminMeeting meeting, @RequestParam("page") int page, Model model) {
			System.out.println("controller in");
			System.out.println("meeting_start_date:"+ meeting.getMeeting_start_date());
			System.out.println("meeting_passwd:"+ meeting.getMeeting_passwd());
			System.out.println("page:"+ page);			

			int result = service.update(meeting);
			if (result == 1)
				System.out.println("회의 정보수정 성공");

			model.addAttribute("result", result);
			model.addAttribute("page", page);

			return "meeting/updateresult";
		}

		// 회의 삭제
		@RequestMapping("admin/meetingdelete")
		public String delete(@RequestParam("meeting_id") String meeting_id, Model model) {
			System.out.println("meeting_id:"+ meeting_id);
			
			int result = 0; 
			result = service.delete(meeting_id);
			
			model.addAttribute("result", result);
			
			return "meeting/deleteresult";
		}
}
