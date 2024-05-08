package com.team5.zzoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team5.zzoom.model.AdminManager;
import com.team5.zzoom.service.AdminManagerService;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminManagerController {
	
	@Autowired
	private AdminManagerService service;
	
	
	// 로그인 폼
	@RequestMapping("adminloginform")
	public String adminloginform() {
		return "admin/adminloginform";
	}
	
	
	// 로그인
	@RequestMapping("adminlogin")
	public String adminlogin(AdminManager manager, HttpSession session, Model model) {
		
		System.out.println("adminlogin");
		
		int result = 0;
		AdminManager manage = service.getManager(manager);
		System.out.println("manage:"+ manage);
		if(manage != null) {
			result = 1;
			session.setAttribute("adminid", manager.getManager_id());
		}else {
			result = -1;
		}		
		
		model.addAttribute("result", result);
		
		return "admin/adminloginresult";
	}
	
	// 관라자 메인
	@RequestMapping("adminmain")
	public String adminmain() {
		return "admin/adminmain";
	}
	
	// 관리자 로그아웃
	@RequestMapping("adminlogout")
	public String adminlogout(HttpSession session) {
		session.invalidate();
		
		return "admin/adminlogout";
	}
	
	
	
}
