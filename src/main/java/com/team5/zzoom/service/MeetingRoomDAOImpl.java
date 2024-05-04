package com.team5.zzoom.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.MeetingRoomDAO;
import com.team5.zzoom.model.MemberDTO;
@Service
public class MeetingRoomDAOImpl implements MeetingRoomDAO {
	@Autowired
	MeetingRoomDAO dao;
	
	public List<MemberDTO> getMemberList(int roomNum){
		List<MemberDTO> memberList = null;
		try {
			memberList = dao.getMemberList(roomNum); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		return memberList;
	}
	public int updateMemberNowRoomState(String member_id) {
		int result = 0;
		try {
			result = dao.updateMemberNowRoomState(member_id); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		return result;
	}
	
}
