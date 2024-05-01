package com.team5.zzoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.AdminAnswerDAO;

@Service
public class AdminAnswerService {
	
	@Autowired
	private AdminAnswerDAO dao;

}
