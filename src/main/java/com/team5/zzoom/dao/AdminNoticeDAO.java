package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.AdminNotice;

@Mapper
public interface AdminNoticeDAO {

	int getCount();

	List<AdminNotice> getNoticelist(int start);

	void updatecount(int no);

	AdminNotice getNotice(int notice_id);

	



}
