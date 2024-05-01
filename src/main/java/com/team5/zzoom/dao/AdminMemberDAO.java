package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.AdminMember;

@Mapper
public interface AdminMemberDAO {

	int getCount();

	List<AdminMember> getMemberlist(int start);

	AdminMember getMember(String member_id);
	
	int update(String member_id);

	int delete(String member_id);

	

}
