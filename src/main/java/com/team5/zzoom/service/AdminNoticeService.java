package com.team5.zzoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.AdminNoticeDAO;
import com.team5.zzoom.model.AdminNotice;

@Service
public class AdminNoticeService {
	
	@Autowired
	private AdminNoticeDAO dao;

	public int getCount() {
		return dao.getCount();
	}

	public List<AdminNotice> getNoticelist(int start) {
		return dao.getNoticelist(start);
	}

	public void updatecount(int no) {
		dao.updatecount(no);
	}

	public AdminNotice getNotice(int notice_id) {
		return dao.getNotice(notice_id);
	}

	public int insert(AdminNotice notice) {
		return dao.insert(notice);
	}

	public int update(AdminNotice notice) {
		return dao.update(notice);
	}

	public int delete(int notice_id) {
		return dao.delete(notice_id);
	}






}
