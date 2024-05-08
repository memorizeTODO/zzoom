package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.AdminMember;

@Mapper
public interface AdminMemberDAO {

	public int getCount();

	public List<AdminMember> getMemberlist(int start);

	public AdminMember getMember(String member_id);
	
	public int update(String member_id);

	public int delete(String member_id);

	

}
