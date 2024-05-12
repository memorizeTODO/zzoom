package com.team5.zzoom.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("meetingRoomDTO")
public class MeetingRoomDTO {
	
	
	private String meeting_id;
	private String meeting_num;
	private String meeting_topic;
	private String meeting_passwd;
	private int meeting_member_num;
	private LocalDateTime meeting_start_date;
	private Date meeting_registration_date;
	private int meeting_join;
	private String member_name;
	private String member_id;
	private int meeting_member_nownum;

	
	
}
