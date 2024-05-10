package com.team5.zzoom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team5.zzoom.model.AdminMember;
import com.team5.zzoom.service.AdminMemberService;

@Controller
public class AdminMemberController {

	@Autowired
	private AdminMemberService service;

	// 회원목록
	@RequestMapping("admin/memberlist")
	public String memberlist(@RequestParam(value="page",defaultValue = "1") int page,  Model model) {
		
		int limit = 10;
		
		int listcount = service.getCount();
		System.out.println("listcount:"+ listcount);
		
		int start = (page - 1) * limit;   // limit  start , 10
		
		List<AdminMember> memberlist = service.getMemberlist(start);
		System.out.println("memberlist:"+ memberlist);
		
		// 총페이지
		int pageCount = listcount/limit+((listcount%10==0)?0:1);
		
		int startPage = ((page-1)/10) * limit + 1;	// 1, 11, 21...
		int endPage = startPage + 10 - 1;			//10, 20, 30...
		
		if(endPage > pageCount)
			endPage = pageCount;
		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);		
		

		return "admin/member/memberlist";
	}
	
	//회원 수정
	@RequestMapping("admin/memberupdate")
	public String memberupdate(@RequestParam("member_id") String member_id, Model model) {
		System.out.println("member_id:"+ member_id);
		
		int result = 0;
		result = service.update(member_id);
		
		model.addAttribute("result", result);
		
		return "member/updateresult";
	}

	// 회원탈퇴
	@RequestMapping("admin/memberdelete")
	public String delete(@RequestParam("member_id") String member_id, Model model) {
		System.out.println("member_id:"+ member_id);
		
		int result = 0; 
		result = service.delete(member_id);
		
		model.addAttribute("result", result);
		
		return "admin/member/deleteresult";
	}
	
	
	
	
	
}
