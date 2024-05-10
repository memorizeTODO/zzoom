package com.team5.zzoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.MemberDAO;
import com.team5.zzoom.model.MemberDTO;

@Service
public class MemberDAOImpl implements MemberDAO {
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
		System.out.println("서비스 진입");
		return dao.findId(member);
	}
	// 로그인, 아이디 확인
	public MemberDTO memberCheck(MemberDTO member) {
		System.out.println("Access memberCheck service");
		return dao.memberCheck(member);
	}

	// 아이디(ajax) 중복 검사
	public MemberDTO memberCheckId(String memid) throws Exception {
		System.out.println("Access memberCheckId service");
		System.out.println("서비스클래스 memid:" + memid);
		MemberDTO mem = null;
		mem = dao.memberCheckId(memid);
		System.out.println("memid:" + memid);
		return mem;
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
	public int memberDelete(String member_id) {
		System.out.println("Access memberDelete service");
		return dao.memberDelete(member_id);
	}
}
