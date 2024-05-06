package com.team5.zzoom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team5.zzoom.model.NoticeVO;
import com.team5.zzoom.service.NoticeService;



@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	//공지글 작성폼
	@RequestMapping("noticeform")
	public String noticeform() {
		return "NoticeInsert";
	}

	//공지글 작성
	@RequestMapping("noticeinsert")
	public String noticeinsert(NoticeVO notice) {

		int result = noticeService.insert(notice);
		System.out.println("result:" + result);

		return "redirect:noticelist";
	}
	
	//공지글 목록
	@RequestMapping("noticelist")
	public String noticelist(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		int limit = 10;

		int listcount = noticeService.getCount();
		System.out.println("listcount:" + listcount);

		int start = (page - 1) * limit;
		
		List<NoticeVO> noticelist = noticeService.getBoardList(start);
		System.out.println("noticelist:" + noticelist);

		// 총페이지
		int pageCount = listcount / limit + ((listcount % 10 == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10) * limit + 1; // 1, 11, 21...
		int endPage = startPage + 10 - 1; // 10, 20, 30...

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return  "NoticeList";
	}
	
	//상세 페이지
	@RequestMapping("noticedetail")
	public String noticedetail (@RequestParam("notice_id")   int notice_id, 
													    @RequestParam("page")  String page , 
													    Model model ) {
		System.out.println("notice_id:"+ notice_id);
		System.out.println("page:"+ page);
		
		noticeService.noticeCount(notice_id);   //	조회수 증가
		
		NoticeVO notice = noticeService.getNotice(notice_id);		
		model.addAttribute("notice", notice);
		model.addAttribute("page", page);
		
		return "NoticeDetail";
	}
	
	
	// 수정 폼
	@RequestMapping("noticeUpdate")
	public String noticeUpdate(@RequestParam("notice_id")   int notice_id, 
															@RequestParam("page")  String page , 
															Model model) {
		
		NoticeVO notice = noticeService.getNotice(notice_id);		
		model.addAttribute("notice", notice);
		model.addAttribute("page", page);
		
		return "NoticeUpdate";
	}	
	
	// 공지사항 수정
	@RequestMapping("update_notice")
	public String update(@ModelAttribute   NoticeVO notice, 
											  @RequestParam("page")	   int  page) {
		
		System.out.println("수정폼에서 notice_id:"+ notice.getNotice_id());
		System.out.println("수정폼에서 notice_subject:"+ notice.getNotice_subject());
		System.out.println("수정폼에서 notice_content:"+ notice.getNotice_content());
		System.out.println("수정폼에서 page:"+ page);			

		int result = noticeService.update(notice);
		System.out.println("result:" + result);

		return "redirect:noticelist?page="+ page;
	}

	//삭제 폼
	@RequestMapping("noticeDelete")
	public String boardDelete(@RequestParam("notice_id") int notice_id, 
														@RequestParam("page") String page, Model model) {	
		
		int result = noticeService.delete(notice_id);    // 글삭제
		
		return "redirect:noticelist?page="+ page;
	}
	

}
