package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.AdminMeeting;

@Mapper
public interface AdminMeetingDAO {

	public int getCount();

	public List<AdminMeeting> getMeetinglist(int start);

	public int update(AdminMeeting meeting);
	
	public AdminMeeting getMeeting(String meeting_id);

	public int delete(String meeting_id);

	

}
