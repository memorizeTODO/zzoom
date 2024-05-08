package com.team5.zzoom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.AdminMeetingDAO;
import com.team5.zzoom.model.AdminMeeting;

@Service
public class AdminMeetingService {
	
	@Autowired
	private AdminMeetingDAO dao;

	public int getCount() {
		return dao.getCount();
	}

	public List<AdminMeeting> getMeetinglist(int start) {
		return dao.getMeetinglist(start);
	}

	public int update(AdminMeeting meeting) {
		return dao.update(meeting);
	}
	
	public AdminMeeting getMeeting(String meeting_id) {
		return dao.getMeeting(meeting_id);
	}

	public int delete(String meeting_id) {
		return dao.delete(meeting_id);
	}


}
