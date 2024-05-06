package com.team5.zzoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.team5.zzoom.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
}
