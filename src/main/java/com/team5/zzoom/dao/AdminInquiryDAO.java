package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.AdminInquiry;
import com.team5.zzoom.model.AdminReply;

@Mapper
public interface AdminInquiryDAO {

	public int getCount();

	public List<AdminInquiry> getInquirylist(int start);

	public AdminInquiry getInquiry(int inquiry_id);
	
	public AdminReply getReply(int inquiry_id);

}
