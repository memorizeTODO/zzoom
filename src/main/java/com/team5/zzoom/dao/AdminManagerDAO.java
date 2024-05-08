package com.team5.zzoom.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.AdminManager;

@Mapper
public interface AdminManagerDAO {
	
	// 관리자 로그인
	public AdminManager getManager(AdminManager manager);

}
