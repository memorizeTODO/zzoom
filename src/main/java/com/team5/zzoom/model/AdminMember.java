package com.team5.zzoom.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("member")
public class AdminMember {
	
	private String member_id;
	private String member_name;
	private String meeting_id;
	private String member_passwd;
	private String member_phone;
	private String member_email;
	private String member_zipcode;
	private String member_address;
	private String member_address_detail;
	private String member_nowroom_code;
	private int member_state;
	private String member_stop_content;
	private Date member_stop_start;
	private Date member_stop_end;
	private Date member_regiDate;
	
}
