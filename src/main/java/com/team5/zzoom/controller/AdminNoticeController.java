package com.team5.zzoom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team5.zzoom.model.AdminMember;
import com.team5.zzoom.model.AdminNotice;
import com.team5.zzoom.service.AdminNoticeService;

@Controller
public class AdminNoticeController {
	
	@Autowired
	private AdminNoticeService service;
	
	// 공지사항 목록
	@RequestMapping("noticelist")
	public String noticelist(@RequestParam(value="page",defaultValue = "1") int page,  Model model) {
		
		int limit = 10;
		
		int listcount = service.getCount();
		System.out.println("listcount:"+ listcount);
		
		int start = (page - 1) * limit;   // limit  start , 10
		
		List<AdminNotice> noticelist = service.getNoticelist(start);
		System.out.println("noticelist:"+ noticelist);
		
		// 총페이지
		int pageCount = listcount/limit+((listcount%10==0)?0:1);
		
		int startPage = ((page-1)/10) * limit + 1;	// 1, 11, 21...
		int endPage = startPage + 10 - 1;			//10, 20, 30...
		
		if(endPage > pageCount)
			endPage = pageCount;
		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);		
		
		return "notice/noticelist";
	}

	//공지사항 상세페이지
	@RequestMapping("noticedetail")
	public String noticedetail(@RequestParam("notice_id") int notice_id,
							   @RequestParam("page") int page, 
							   Model model) {
	AdminNotice notice = service.getNotice(notice_id);				 //상세정보 구하기
	String notice_content = notice.getNotice_content().replace("\n","<br>");
	
	model.addAttribute("notice", notice);
	model.addAttribute("notice_content", notice_content);
	model.addAttribute("page", page);
	
	return "notice/noticedetail";
	}
	

}
