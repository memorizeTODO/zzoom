package com.team5.zzoom.model;

import java.sql.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("notice")
public class NoticeVO {
	
	private int notice_id;
	private String notice_subject;
	private String notice_content;
	private String member_passwd;
	private Date notice_date;
	private int notice_count;
	private String manager_name;
	
}
