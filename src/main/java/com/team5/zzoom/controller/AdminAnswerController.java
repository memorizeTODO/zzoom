package com.team5.zzoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.team5.zzoom.service.AdminAnswerService;

@Controller
public class AdminAnswerController {
	
	@Autowired
	private AdminAnswerService service;
}
