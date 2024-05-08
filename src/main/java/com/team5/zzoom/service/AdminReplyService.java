package com.team5.zzoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.AdminReplyDAO;
import com.team5.zzoom.model.AdminReply;

@Service
public class AdminReplyService {
	
	@Autowired
	private AdminReplyDAO dao;

	public int insert(AdminReply reply) {
		return dao.insert(reply);
	}

	public void inquiryState(int inquiry_id) {
		dao.inquiryState(inquiry_id);
	}

}
