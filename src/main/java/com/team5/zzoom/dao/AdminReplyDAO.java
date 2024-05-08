package com.team5.zzoom.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.AdminReply;

@Mapper
public interface AdminReplyDAO {

	public int insert(AdminReply reply);

	public void inquiryState(int inquiry_id);



}
