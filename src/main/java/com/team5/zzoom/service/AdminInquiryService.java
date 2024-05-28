package com.team5.zzoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.model.AdminReply;
import com.team5.zzoom.dao.AdminInquiryDAO;
import com.team5.zzoom.model.AdminInquiry;

@Service
public class AdminInquiryService implements AdminInquiryDAO {
	
	@Autowired
	private AdminInquiryDAO dao;

	public int getCount() {
		return dao.getCount();
	}

	public List<AdminInquiry> getInquirylist(int start) {
		return dao.getInquirylist(start);
	}

	public AdminInquiry getInquiry(int inquiry_id) {
		return dao.getInquiry(inquiry_id);
	}

	public AdminReply getReply(int inquiry_id) {
		// TODO Auto-generated method stub
		return dao.getReply(inquiry_id);
	}
}
