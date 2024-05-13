package com.team5.zzoom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team5.zzoom.model.AdminInquiry;
import com.team5.zzoom.model.AdminNotice;
import com.team5.zzoom.model.AdminReply;
import com.team5.zzoom.service.AdminInquiryService;

@Controller
public class AdminInquiryController {
	 
	@Autowired
	private AdminInquiryService service;
	
	// 문의사항 목록
	@RequestMapping("/admin/inquirylist")
	public String inquirylist(@RequestParam(value="page",defaultValue = "1") int page,  Model model) {
		
		int limit = 10;
		
		int listcount = service.getCount();
		System.out.println("listcount:"+ listcount);
		
		int start = (page - 1) * limit;   // limit  start , 10
		
		List<AdminInquiry> inquirylist = service.getInquirylist(start);
		System.out.println("inquirylist:"+ inquirylist);
		
		// 총페이지
		int pageCount = listcount/limit+((listcount%10==0)?0:1);
		
		int startPage = ((page-1)/10) * limit + 1;	// 1, 11, 21...
		int endPage = startPage + 10 - 1;			//10, 20, 30...
		
		if(endPage > pageCount)
			endPage = pageCount;
		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("inquirylist", inquirylist);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);	
		
		
		/* List<E> inquirylist = service.getInquirylist(); */

		return "inquiry/inquirylist";
	}
	
	// 문의사항 상세페이지
	@RequestMapping("admin/inquirydetail")
	public String inquirydetail(@RequestParam("inquiry_id") int inquiry_id, 
								@RequestParam("member_id") String member_id, 
			                    @RequestParam("page") int page, Model model) {
		AdminInquiry inquiry = service.getInquiry(inquiry_id); // 상세정보 구하기
		AdminReply reply = service.getReply(inquiry_id);
		model.addAttribute("inquiry", inquiry);
		model.addAttribute("reply", reply);
		model.addAttribute("member_id", member_id);
		model.addAttribute("page", page);

		return "inquiry/inquirydetail";
	}

	
	
	
	
}
