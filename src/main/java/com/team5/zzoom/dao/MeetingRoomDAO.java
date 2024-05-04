package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team5.zzoom.model.MemberDTO;

@Mapper
public interface MeetingRoomDAO {
	public List<MemberDTO> getMemberList(@Param("room_num") int roomNum);

	public int updateMemberNowRoomState(@Param("meeting_room_nownum")String member_id);
}
