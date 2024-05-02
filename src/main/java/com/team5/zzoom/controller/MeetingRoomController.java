package com.team5.zzoom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class MeetingRoomController {

	@RequestMapping("/meetingroom")
	public String test(Model model) {

		return "meetingroom";
	}
}
