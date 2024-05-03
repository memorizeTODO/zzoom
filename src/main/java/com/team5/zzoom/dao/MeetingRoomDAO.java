package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team5.zzoom.model.MemberDTO;

public interface MeetingRoomDAO {
	public List<MemberDTO> getMemberList(@Param("room_id") int roomID);
}
