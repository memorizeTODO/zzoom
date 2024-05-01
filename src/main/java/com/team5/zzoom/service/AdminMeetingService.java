package com.team5.zzoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.AdminMeetingDAO;

@Service
public class AdminMeetingService {
	
	@Autowired
	private AdminMeetingDAO dao;
}
