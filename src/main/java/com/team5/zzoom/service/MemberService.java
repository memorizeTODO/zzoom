package com.team5.zzoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.MemberDAO;
import com.team5.zzoom.model.MemberDTO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;

	// 회원가입
	public int memberInsert(MemberDTO member) {
		return dao.memberInsert(member);
	}

	// 비밀번호 찾기
	public MemberDTO passwdFind(MemberDTO member) {
		System.out.println("Access passwdFind service");
		return dao.passwdFind(member);
	}
	//아이디 찾기
	public MemberDTO findId(MemberDTO member) {
		return dao.findId(member);
	}
	// 로그인, 아이디 확인
	public MemberDTO memberCheck(MemberDTO member) {
		System.out.println("Access memberCheck service");
		return dao.memberCheck(member);
	}

	// 아이디(ajax) 중복 검사
	public int memberCheckId(String memid) throws Exception {
		System.out.println("Access memberCheckId service");
		System.out.println("서비스클래스 memid:" + memid);

		int result = -1; // 사용 가능 아이디
		MemberDTO mem = dao.memberCheckId(memid);
		System.out.println("id중복 member:" + mem);

		if (mem != null) {
			result = 1; // 중복 아이디
		}
		return result;
	}

	// 회원정보 수정에 기존 정보 표출
	public MemberDTO myPage(String member_id) {
		return dao.myPage(member_id);
	}

	// 회원정보 수정
	public void memberUpdate(MemberDTO member) {
		System.out.println("Access memberUpdate service");
		System.out.println("member:" + member);
		dao.memberUpdate(member);
	}

	// 회원탈퇴
	public void memberDelete(MemberDTO member) {
		System.out.println("Access memberDelete service");
		dao.memberDelete(member);
	}
}
