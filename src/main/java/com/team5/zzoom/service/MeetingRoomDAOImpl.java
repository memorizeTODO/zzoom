package com.team5.zzoom.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.zzoom.dao.MeetingRoomDAO;
import com.team5.zzoom.model.MeetingRoomDTO;
import com.team5.zzoom.model.MemberDTO;
import com.team5.zzoom.model.ReservationDTO;
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
	public int updateMyNowRoomState(String member_id, String roomNum) {
		int result = 0;
		try {
			result = dao.updateMyNowRoomState(member_id, roomNum); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		return result;
	}
	public int getMeetingJoin(int roomNum) {
		// TODO Auto-generated method stub
		return dao.getMeetingJoin(roomNum);
	}
	
	public int updateMeetingNowNumPlus(int roomNum) {
		int result = 0;
		try {
			result = dao.updateMeetingNowNumPlus(roomNum); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		return result;
	}
	public int updateMeetingNowNumMinus(int roomNum) {
		int result = 0;
		try {
			result = dao.updateMeetingNowNumMinus(roomNum); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		return result;
	}
	public List<MemberDTO> getAllMemberKeepAlive() {
		// TODO Auto-generated method stub
		List<MemberDTO> memberList = null;
		
		try {
			memberList=dao.getAllMemberKeepAlive(); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		
		return memberList;
	}
	
	public int updateMeetingNowNum(int roomNum, String roomNumSTR) {
		int result = 0;
		try {
			result = dao.updateMeetingNowNum(roomNum, roomNumSTR); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		return result;
	}
	public int updateKeepAlive(String member_id, Timestamp now) {
		int result = 0;
		try {
			result = dao.updateKeepAlive(member_id, now); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		return result;
	}
	public MeetingRoomDTO getMeetingRoom(int roomNum) {
		// TODO Auto-generated method stub
		MeetingRoomDTO meetingRoomDTO = null;
		
		try {
			meetingRoomDTO=dao.getMeetingRoom(roomNum); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		
		return  meetingRoomDTO;
	}
	public int updateMeetingRoomJoin(int roomNum, int value) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = dao.updateMeetingRoomJoin(roomNum, value); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		return result;
	}
	public String getMyNowRoomState(String member_id) {
		String memberNowRoomCode = null;
		
		try {
			memberNowRoomCode=dao.getMyNowRoomState(member_id); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		
		return  memberNowRoomCode;
	}
	public List<MeetingRoomDTO> getAllMeetingRoom() {
		List<MeetingRoomDTO> meetingRoomList = null;
		
		try {
			meetingRoomList = dao.getAllMeetingRoom(); 
		} catch (SqlSessionException e) {
		    // SqlSessionException 처리 코드
			e.printStackTrace();
		} catch (PersistenceException e) {
		    // PersistenceException 처리 코드
			e.printStackTrace();
		}
		
		return  meetingRoomList;
	}
	public int deleteMeetingRoom(String meeting_id) {
		
		int result = 0;
		try {
			result = dao.deleteMeetingRoom(meeting_id); 
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
