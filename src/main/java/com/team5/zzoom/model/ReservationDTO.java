package com.team5.zzoom.model;

import java.sql.Date;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;



@Data
@Alias("Reservation")
public class ReservationDTO {
	
	public String getmeeting_id() {
		 return meeting_id;
	}
	public void setmeeting_id(String meeting_id) {
		this.meeting_id = meeting_id;
	}
	public String getmeeting_room_num() {
		 return meeting_room_num;
	}
	public void setmeeting_room_num(String meeting_room_num) {
		this.meeting_room_num = meeting_room_num;
	}
	public String getmeeting_num() {
		return meeting_num;
	}
	public void setmeeting_num(String meeting_num) {
		this.meeting_num = meeting_num;
	}
	public String getmeeting_topic() {
		return meeting_topic;
	}
	public void setmeeting_topic(String meeting_topic) {
		this.meeting_topic = meeting_topic;
	}
	public String getmeeting_passwd() {
		return meeting_passwd;
	}
	public void setmeeting_passwd(String meeting_passwd) {
		this.meeting_passwd =  meeting_passwd;
	}
	public int getmeeting_member_num() {
		return meeting_member_num;
	}
	public void setmeeting_member_num(int meeting_member_num) {
		this.meeting_member_num = meeting_member_num;
	}
	public LocalDateTime getmeeting_start_date() {
		return meeting_start_date;
	}
	public void setmeeting_start_date(LocalDateTime meeting_start_date) {
		this.meeting_start_date = meeting_start_date;
	}
	public Date getmeeting_registration_date() {
		return meeting_registration_date;
	}
	public void setmeeting_registration_date(Date meeting_registration_date) {
		this.meeting_registration_date = meeting_registration_date;
	}
	public int getmeeting_join() {
		return meeting_join;
	}
	public void setmeeting_join(int meeting_Join) {
		this.meeting_join = meeting_Join;
	}
	public String getmember_name() {
		return member_name;
	}
	public void setmember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getmember_id() {
		return member_id;
	}
	public void setmember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getmeeting_member_nownum() {
		return meeting_member_nownum;
	}
	public void setmeeting_member_nownum(int meeting_member_nownum) {
		this.meeting_member_nownum = meeting_member_nownum;
	}
	
	
	
	private String meeting_id;
	private String meeting_room_num;
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
