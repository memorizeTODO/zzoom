package com.team5.zzoom.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.MemberDTO;

@Mapper
public interface MemberDAO {
	
	//회원가입
	public int memberInsert(MemberDTO member);
	
	//로그인 인증,
	public MemberDTO memberCheck(MemberDTO member);
	
	//ajax 중복 체크
	public MemberDTO memberCheckId(String memid) throws Exception;
	
	//회원정보 수정
	public void memberUpdate(MemberDTO member);
	
	//회원삭제
	public void memberDelete(MemberDTO member);
	
	//비밀번호 찾기
	public MemberDTO passwdFind(MemberDTO member);
	
	// 회원정보 페이지에 기존 정보 표출
	public MemberDTO myPage(String member_id);
	
	// 아이디 찾기
	public MemberDTO findId(MemberDTO member);
}