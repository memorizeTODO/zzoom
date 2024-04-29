package com.team5.zzoom.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
@Alias("Reservation")
public class ReservationDTO {

	private String meeting_ID;
	private String meeting_room_num;
	private String meeting_num;
	private String meeting_topic;
	private String meeting_owner ;
	private String meeting_owner_ID;
	private String meeting_passwd;
	private String meeting_member_num;
	private String meeting_start_date;
	private String meeting_registration_date;
	
	
}
