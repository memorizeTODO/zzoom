package com.team5.zzoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.AdminMemberDAO;
import com.team5.zzoom.model.AdminMember;

@Service
public class AdminMemberService {

	@Autowired
	private AdminMemberDAO dao;

	public int getCount() {
		return dao.getCount();
	}

	public List<AdminMember> getMemberlist(int start) {
		return dao.getMemberlist(start);
	}

	public AdminMember getMember(String member_id) {
		return dao.getMember(member_id);
	}
	
	public int update(String member_id) {
		return dao.update(member_id);
	}

	public int delete(String member_id) {
		return dao.delete(member_id);
	}



}
