package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.AdminNotice;

@Mapper
public interface AdminNoticeDAO {

	public int getCount();

	public List<AdminNotice> getNoticelist(int start);

	public void updatecount(int no);

	public AdminNotice getNotice(int notice_id);

	public int insert(AdminNotice notice);

	public int update(AdminNotice notice);

	public int delete(int notice_id);


	



}
