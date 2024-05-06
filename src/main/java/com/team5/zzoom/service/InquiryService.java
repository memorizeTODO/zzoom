package com.team5.zzoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.InquiryDAO;
import com.team5.zzoom.model.InquiryVO;

@Service
public class InquiryService {

	@Autowired
	private InquiryDAO dao;
	
	public int insert(InquiryVO inquiry) {
		return dao.insert(inquiry);
	}

	public int getCount() {
		return dao.getCount();
	}

	public List<InquiryVO> getBoardList(int start) {
		return dao.getBoardList(start);
	}

	public InquiryVO getInquiry(int inquiry_id) {
		return dao.getInquiry(inquiry_id);
	}

	public InquiryVO getinquiry(int inquiry_id) {
		return dao.getinquiry( inquiry_id);
	}

	public int update(InquiryVO inquiry) {
		return dao.update(inquiry);
	}
	
	public int delete(int inquiry_id) {
		return dao.delete(inquiry_id);
	}


}
