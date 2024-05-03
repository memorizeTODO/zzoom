package com.team5.zzoom.model;

import java.sql.Date;

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
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_passwd() {
		return member_passwd;
	}
	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_nowRoom_code() {
		return member_nowRoom_code;
	}
	public void setMember_nowRoom_code(String member_nowRoom_code) {
		this.member_nowRoom_code = member_nowRoom_code;
	}
	public String getMember_zipcode() {
		return member_zipcode;
	}
	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_address_detail() {
		return member_address_detail;
	}
	public void setMember_address_detail(String member_address_detail) {
		this.member_address_detail = member_address_detail;
	}
	public Date getMember_regiDate() {
		return member_regiDate;
	}
	public void setMember_regiDate(Date member_regiDate) {
		this.member_regiDate = member_regiDate;
	}
	public int getMember_state() {
		return member_state;
	}
	public void setMember_state(int member_state) {
		this.member_state = member_state;
	}
	public String getMember_stop_content() {
		return member_stop_content;
	}
	public void setMember_stop_content(String member_stop_content) {
		this.member_stop_content = member_stop_content;
	}
	public Date getMember_stop_start() {
		return member_stop_start;
	}
	public void setMember_stop_start(Date member_stop_start) {
		this.member_stop_start = member_stop_start;
	}
	public Date getMember_stop_end() {
		return member_stop_end;
	}
	public void setMember_stop_end(Date member_stop_end) {
		this.member_stop_end = member_stop_end;
	}
}
