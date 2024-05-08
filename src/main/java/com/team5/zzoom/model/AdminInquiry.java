package com.team5.zzoom.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("inquiry")
public class AdminInquiry {
	
	private int inquiry_id;
	private String member_id;
	private String member_name;
	private String inquiry_subject;
	private String inquiry_content;
	private Date inquiry_date;
	private String inquiry_count;
	private String inquiry_completed;

	
}
