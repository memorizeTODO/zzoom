package com.team5.zzoom.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("notice")
public class AdminNotice {
	private int notice_id;
	private String notice_subject;
	private String notice_content;
	private Date notice_date;
}
