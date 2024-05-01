package com.team5.zzoom.model;

import java.sql.Date;

import lombok.Data;

@Data
public class AdminMeeting {
	private String meeting_id;
	private String member_id;
	private String meeting_room_num;
	private String meeting_num;
	private String meeting_topic;
	private String meeting_passwd;
	private int meeting_member_num;
	private Date meeting_start_date;
	private Date meeting_registration_date;
	private String meeting_name;
	
}
