package com.team5.zzoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.AdminManagerDAO;
import com.team5.zzoom.model.AdminManager;

@Service
public class AdminManagerService {

	@Autowired
	private AdminManagerDAO dao;

	public AdminManager getManager(AdminManager manager) {
		return dao.getManager(manager);
	}
}
