package com.team5.zzoom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team5.zzoom.model.InquiryVO;
import com.team5.zzoom.model.NoticeVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@RequestMapping("mainpage")
	public String gotoMainPage(Model model){
		return "Main";
	}
	
	
	
	
//	@RequestMapping("noticelist")
//	public String noticelist(NoticeVO notice) {
//		
//		int result = mainService.insert(main);
//		System.out.println("result:" + result);
//			
//		return "NoticeList";
//    }
}
