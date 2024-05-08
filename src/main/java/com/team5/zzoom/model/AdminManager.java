package com.team5.zzoom.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("manager")
public class AdminManager {

	private String manager_id;
	private String manager_passwd;
	private String manager_name;
	private String manager_phone;
	private String manager_email;
	
	
}
