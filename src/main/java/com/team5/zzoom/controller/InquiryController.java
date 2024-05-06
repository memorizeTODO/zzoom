package com.team5.zzoom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team5.zzoom.model.InquiryVO;
import com.team5.zzoom.model.NoticeVO;
import com.team5.zzoom.model.ReplyVO;
import com.team5.zzoom.service.InquiryService;
import com.team5.zzoom.service.ReplyService;

import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	
	@Autowired
	private ReplyService replyService;

	// 문의사항 작성 폼
	@RequestMapping("inquiryform")
	public String inquiryfrom() {
		return "InquiryInsert";
	}

	// 문의글 작성
	@RequestMapping("submit_inquiry")
	public String inquiryinsert(InquiryVO inquiry,
														HttpSession session) {
		//회원 아이디값 구해옴
//		String member_id = (String)session.getAttribute("member_id");
		String member_id = "test"; //테스트용이라 지워야함 나중에				
		System.out.println("controller access");
		inquiry.setMember_id(member_id);
		
		inquiry.setMember_name("test");		
		
		int result = inquiryService.insert(inquiry);
		System.out.println("inquiry : " + inquiry);

		return "redirct:inquirylist";
	}

	// 문의글 목록
	@RequestMapping("inquirylist") 
	public String inquirylist(@RequestParam(value= "page", defaultValue = "1") int page, Model model) {

		int limit = 10;

		int listcount = inquiryService.getCount(); 
		System.out.println("listcoun:" + listcount);

		int start = (page - 1) * limit;

		List<InquiryVO> inquirylist = inquiryService.getBoardList(start);
		System.out.println("inquirylist : " + inquirylist);
  
		//총 페이지
		int pageCount = listcount / limit + ((listcount % 10 == 0) ? 0 : 1);
		
		int startPage = ((page - 1) / 10) * limit + 1; // 1, 11, 21...
		int endPage =startPage + 10 - 1; // 10, 20, 30...
		
		if (endPage > pageCount) endPage = pageCount;
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("inquirylist", inquirylist);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		
		return "InquiryList"; 
	}
	
	//상세페이지
	@RequestMapping("inquirydetail")
	public String inquirydetail(@RequestParam("inquiry_id") int inquiry_id,
														@RequestParam("page") String page,
														Model model) {
		InquiryVO inquiry = inquiryService.getInquiry(inquiry_id); // 문의 상세정보
		
		// 뎃글목록
		List<ReplyVO>  replylist = replyService.getReplylist(inquiry_id);
		System.out.println("replylist : " + replylist);
		
		
		model.addAttribute("inquiry", inquiry);
		model.addAttribute("replylist", replylist);
		model.addAttribute("page", page);
		
		return "InquiryDetail";
	}
		
	//문의사항 수정 폼
	@RequestMapping("inquiryUpdate")
	public String inquiryUpdate(@RequestParam("inquiry_id") int inquiry_id,
															@RequestParam("page") String page,
															Model model){
		System.out.println("controller access");
	InquiryVO inquiry = inquiryService.getinquiry(inquiry_id);		
	model.addAttribute("inquiry", inquiry);
	model.addAttribute("page", page);													
	
		return "InquiryUpdate";
	}
	
	//문의사항 수정
	@RequestMapping("update_inquiry")
	public String update(@ModelAttribute InquiryVO inquiry,
											  @RequestParam("page") int page) {
		
		System.out.println("수정폼에서 inquiry_id : "+ inquiry.getInquiry_id());
		System.out.println("수정폼에서 inquiry_subject : "+ inquiry.getInquiry_subject());
		System.out.println("수정폼에서 inquiry_content : "+ inquiry.getInquiry_content());
		System.out.println("수정폼에서 member_id :"+ inquiry.getMember_id());
		System.out.println("수정폼에서 member_name :"+ inquiry.getMember_name());
		System.out.println("수정폼에서 inquiry_completed : "+ inquiry.getInquiry_completed());
		System.out.println("수정폼에서 page : "+ page);		
		
		int result = inquiryService.update(inquiry);
		System.out.println("result : " + result);
		
		return "redirect:inquirylist?page=" + page;
	}
	
	//문의사항 삭제 폼
	@RequestMapping("inquiryDelete")
	public String boardDelete(@RequestParam("inquiry_id") int inquiry_id,
														@RequestParam("page") String page,
														Model model) {
		
		int result = inquiryService.delete(inquiry_id);
		
		return "redirect:inquirylist?page = " + page;
	}
	
}
