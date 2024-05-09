package com.team5.zzoom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String noticelist(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		int limit = 10;

		int listcount = service.getCount();
		System.out.println("listcount:" + listcount);

		int start = (page - 1) * limit; // limit start , 10

		List<AdminNotice> noticelist = service.getNoticelist(start);
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

		return "notice/noticelist";
	}

	// 공지사항 상세페이지
	@RequestMapping("noticedetail")
	public String noticedetail(@RequestParam("notice_id") int notice_id, @RequestParam("page") int page, Model model) {
		AdminNotice notice = service.getNotice(notice_id); // 상세정보 구하기

		model.addAttribute("notice", notice);
		model.addAttribute("page", page);

		return "notice/noticedetail";
	}

	// 공지사항 작성폼
	@RequestMapping("noticeform")
	public String noticeform() {
		return "notice/noticeform";
	}

	// 공지사항 글작성
	@RequestMapping("noticewrite")
	public String noticewrite(@ModelAttribute AdminNotice notice, Model model) {

		int result = service.insert(notice);
		if (result == 1)
			System.out.println("공지사항 글작성 성공");

		model.addAttribute("result", result);

		return "notice/writeresult";
	}

	// 공지사항 수정폼
	@RequestMapping("updateform")
	public String updateform(@RequestParam("notice_id") int notice_id, @RequestParam("page") int page, Model model) {

		AdminNotice notice = service.getNotice(notice_id); // 상세정보 구하기

		model.addAttribute("notice", notice);
		model.addAttribute("page", page);

		return "notice/updateform";
	}

	// 공지사항 글수정
	@RequestMapping("noticeupdate")
	public String noticeupdate(@ModelAttribute AdminNotice notice, @RequestParam("page") int page, Model model) {
		System.out.println("controller in");
		System.out.println("notice_id:"+ notice.getNotice_id());
		System.out.println("notice_subject:"+ notice.getNotice_subject());
		System.out.println("notice_content:"+ notice.getNotice_content());
		System.out.println("page:"+ page);
		

		int result = service.update(notice);
		if (result == 1)
			System.out.println("공지사항 글수정 성공");

		model.addAttribute("result", result);
		model.addAttribute("notice_id", notice.getNotice_id());
		model.addAttribute("page", page);

		return "notice/updateresult";
	}
	
	// 공지사항 삭제
		@RequestMapping("deleteform")
		public String deleteform(@RequestParam("notice_id") int notice_id, @RequestParam("page") int page, Model model) {

			int result = service.delete(notice_id); // 상세정보 구하기

			model.addAttribute("result", result);
			model.addAttribute("page", page);

			return "notice/deleteresult";
		}
}
