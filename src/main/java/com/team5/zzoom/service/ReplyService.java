package com.team5.zzoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.ReplyDAO;
import com.team5.zzoom.model.ReplyVO;

@Service
public class ReplyService {

	@Autowired
	private ReplyDAO dao;

	public List<ReplyVO> getReplylist(int inquiry_id) {
		return  dao.getReplylist(inquiry_id);
	}
	
	
}
