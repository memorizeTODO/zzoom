package com.team5.zzoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
