package com.team5.zzoom.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("answer")
public class AdminAnswer {
	
	private int answer_id;
	private String manager_id;
	private String member_id;
	private int inquiry_id;
	private String manager_name;
	private String answer_contents;
	private Date answer_date;

	
	
}
