package com.team5.zzoom.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.NoticeDAO;
import com.team5.zzoom.model.NoticeVO;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO dao;

	public int insert(NoticeVO notice) {
		return dao.insert(notice);
	}

	public int getCount() {
		return dao.getCount();
	}

	public List<NoticeVO> getBoardList(int start) {
            return dao.getBoardList(start);
	}

	public NoticeVO getNotice(int notice_id) {
		return dao.getNotice(notice_id);
	}

	public int update(NoticeVO notice) {
		return dao.update(notice);
	}

	public int delete(int notice_id) {
		return dao.delete(notice_id);
	}

	public int noticeCount(int notice_id) {
		return dao.noticeCount(notice_id);
	}
	
}
