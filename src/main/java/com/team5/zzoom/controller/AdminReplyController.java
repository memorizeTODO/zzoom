package com.team5.zzoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team5.zzoom.model.AdminReply;
import com.team5.zzoom.service.AdminReplyService;

@Controller
public class AdminReplyController {
	
	@Autowired
	private AdminReplyService service;
	
	@RequestMapping("replyform")
	public String replyform(@RequestParam(value="inquiry_id", required=false) String inquiry_id,
						    @RequestParam(value="member_id", required=false) String member_id, Model model)  {
		
		System.out.println("inquiry_id:"+ inquiry_id);
		System.out.println("member_id:"+ member_id);
		
		model.addAttribute("inquiry_id", inquiry_id);
		model.addAttribute("member_id", member_id);
		
		return "reply/replyform";
	}
	
	
	@RequestMapping("reply")
	public String reply(@ModelAttribute AdminReply reply, Model model) {
		
		int result = service.insert(reply);    // 답변글 작성
		if(result==1) {
			
			// 답년글 작성후 문의 게시판의 상태값을 2로 수정
			service.inquiryState(reply.getInquiry_id());			
			System.out.println("답변글 작성 성공");
			System.out.println("문의 게시판의 상태값을 2로 수정 성공");
		}
		
		model.addAttribute("result", result);		
		
		return "reply/writeresult";
	}
	
	
	
	
}
