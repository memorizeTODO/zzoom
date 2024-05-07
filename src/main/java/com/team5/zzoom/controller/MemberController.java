package com.team5.zzoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team5.zzoom.model.MemberDTO;
import com.team5.zzoom.service.MemberDAOImpl;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	private MemberDAOImpl service;

	// 메인 페이지 이동
	@RequestMapping("main")
	public String main() {
		return "member/member_main";
	}

	// 회원가입 폼으로 이동
	@RequestMapping("join")
	public String join() {
		return "member/member_join_form";
	}

	// 회원가입 정보 입력
	@RequestMapping("memberInsert")
	public String memberInsert(@ModelAttribute MemberDTO member, Model model) {
		System.out.println("Access memberinsert");
		int result = service.memberInsert(member);
		System.out.println("result:" + result);

		return "member/member_login";
	}

	// ID 중복검사(ajax)
	@RequestMapping(value = "member_idCheck", method = RequestMethod.POST)
	@ResponseBody
	public Integer member_idCheck(@RequestParam("memid") String memid) throws Exception {
		System.out.println("memid:" + memid);
		int result = 0;
//		model.addAttribute("result", result);
		if(service.memberCheckId(memid)==null) {
			result = -1;
		} else {
			result = 1;
		}

		return result;
	}

	// 로그인 폼으로 이동
	@RequestMapping("login")
	public String login() {
		return "member/member_login";
	}

	// 로그인 기능
	@RequestMapping(value = "member_login", method = RequestMethod.POST)
	public String member_login(@ModelAttribute MemberDTO member, HttpSession session, Model model) {
		System.out.println("Access Login function");
		int result = 0;
		MemberDTO mem = service.memberCheck(member);
		System.out.println("로그인 mem:" + mem);

		if (mem != null) {
			result = 1;

			session.setAttribute("member_id", member.getMember_id());
			return "member/member_main";
		} else {
			result = -1;

			return "redirect:/login";
		}

	}

	// 마이페이지 폼으로 이동
	@RequestMapping("myPage")
	public String myPageForm(HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("member_id");

		MemberDTO member = service.myPage(member_id);

		model.addAttribute("member", member);
		

		return "member/member_myPage";
	}

	// 마이페이지 회원정보 수정
	@RequestMapping(value = "myPageEdit", method = RequestMethod.POST)
	public String myPage(HttpSession session, MemberDTO member, Model model) {
		String member_id = (String) session.getAttribute("member_id");
		MemberDTO db = this.service.myPage(member_id);

		member.setMember_id(member_id);

		service.memberUpdate(member);
		return "member/member_main";
	}

	// 회원 탈퇴 폼 이동
	@RequestMapping("deleteForm")
	public String deletForm(HttpSession session, Model model) {

		String member_id = (String) session.getAttribute("member_id");
		MemberDTO member = service.myPage(member_id);
		model.addAttribute("member_id", member_id);

		return "member/member_deleteForm";
	}
	
	// 회원 탈퇴 기능
	@RequestMapping(value = "delete")
	public String delete(HttpSession session, @RequestParam("member_id") String member_id,
			@RequestParam("member_passwd") String member_passwd, Model model) {
		String id = (String) session.getAttribute("member_id");
		MemberDTO member = service.myPage(member_id);
		model.addAttribute("member_id", member_id);

		if (!member.getMember_passwd().equals(member_passwd)) {
			return "member/member_deleteForm";
		} else {
			MemberDTO db = new MemberDTO();
			db.setMember_id(member_id);
			System.out.println("db:" + db);
			service.memberDelete(db);
			session.invalidate();
			return "member/member_deleteForm";

		}
	}

	// 아이디 찾기 폼
	@RequestMapping("findid")
	public String findID() {
		return "member/member_findID";
	}

	// 아이디 찾기 기능
	@RequestMapping("findIdForm")
	public String find_ID(@ModelAttribute MemberDTO member, Model model) {
		MemberDTO mem = service.findId(member);
		
		if (mem == null) {
			System.out.println("mem:"+mem);
			return "member/member_findID";
		} else {
			model.addAttribute("mem",mem);
			System.out.println("mem:"+mem);
			return "member/member_findID";
		}
	}
	

	// 비밀번호 찾기 폼
	@RequestMapping("findPasswdForm")
	public String findPasswdForm() {
		return "/member/member_findPasswd";
	}

	// 비밀번호 찾기 기능
	@RequestMapping("findPasswd")
	public String passwdFind(@ModelAttribute MemberDTO member, Model model) {
		MemberDTO mem = service.passwdFind(member);
		if (mem == null) {
			System.out.println("mem:"+mem);
			return "member/member_findPasswd";
		} else {
			model.addAttribute("mem",mem);
			System.out.println("mem:"+mem);
			return "member/member_findPasswd";
		}
	}

	// 로그아웃
	@RequestMapping("member_logout")
	public String member_logout(HttpSession session) {
		session.invalidate();
		return "member/member_logout";
	}
}
