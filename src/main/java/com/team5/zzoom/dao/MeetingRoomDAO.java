package com.team5.zzoom.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team5.zzoom.model.MeetingRoomDTO;
import com.team5.zzoom.model.MemberDTO;
import com.team5.zzoom.model.ReservationDTO;

@Mapper
public interface MeetingRoomDAO {
	public List<MemberDTO> getMemberList(@Param("room_num") int roomNum);

	public int updateMyNowRoomState(@Param("member_id")String member_id, @Param("room_num") String roomNum);
	
	public int getMeetingJoin(@Param("room_num")int roomNum);
	
	public int updateMeetingNowNum(@Param("room_num")int roomNum, @Param("room_num_str")String roomNumSTR);
	
	public int updateMeetingNowNumPlus(@Param("room_num")int roomNum);
	
	public int updateMeetingNowNumMinus(@Param("room_num")int roomNum);
	
	public List<MemberDTO> getAllMemberKeepAlive();

	public int updateKeepAlive(@Param("member_id")String member_id,@Param("now_time") Timestamp now);

	public MeetingRoomDTO getMeetingRoom(@Param("room_num")int roomNum);

	public int updateMeetingRoomJoin(@Param("room_num")int roomNum, @Param("value")int value);

	public String getMyNowRoomState(String member_id);

	public List<MeetingRoomDTO> getAllMeetingRoom();

	public int deleteMeetingRoom(String meeting_id);

}
