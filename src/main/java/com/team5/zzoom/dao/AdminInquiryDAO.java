package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.AdminInquiry;

@Mapper
public interface AdminInquiryDAO {

	public int getCount();

	public List<AdminInquiry> getInquirylist(int start);

	public AdminInquiry getInquiry(int inquiry_id);

}
