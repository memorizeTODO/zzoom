package com.team5.zzoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team5.zzoom.service.AdminInquiryService;

@Controller
public class AdminInquiryController {
	 
	@Autowired
	private AdminInquiryService service;
	
	// 문의사항 목록
	@RequestMapping("inquirylist")
	public String inquirylist() {

		return "inquiry/inquirylist";
	}

}
