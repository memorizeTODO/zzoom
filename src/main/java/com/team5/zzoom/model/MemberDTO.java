package com.team5.zzoom.model;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("member")
public class MemberDTO {

	private String member_id;
	private String member_passwd;
	private String member_phone;
	private String member_name;
	private String member_email;
	private String member_nowRoom_code;
	private String member_zipcode;
	private String member_address;
	private String member_address_detail;
	private Date member_regiDate;
	private int member_state;
	private String member_stop_content;
	private Date member_stop_start;
	private Date member_stop_end;
	private Timestamp member_meeting_keepalive;
	
	
	
}
