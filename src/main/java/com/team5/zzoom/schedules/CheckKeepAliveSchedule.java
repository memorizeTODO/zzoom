package com.team5.zzoom.schedules;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.team5.zzoom.model.MemberDTO;
import com.team5.zzoom.service.MeetingRoomDAOImpl;

@Component
public class CheckKeepAliveSchedule {
	
	@Autowired
	private MeetingRoomDAOImpl meetingRoomService;

	@Scheduled(cron = "0/10 * * * * ?")
	public void checkKeepAlive() {
		System.out.println("keepalive 체크 스케쥴러 가동");
		List<MemberDTO> memberList= null;
		Timestamp nowMinus5 = new Timestamp(System.currentTimeMillis()-5000);
		
		
		memberList= meetingRoomService.getAllMemberKeepAlive();
		System.out.println("현재 회의룸을 사용중인 이용자 리스트 : "+ memberList);
		
		for (MemberDTO member : memberList) {
			System.out.println(" 현재 회의룸을 사용중인 이용자 : "+ member);
			Timestamp memberKeepAlive  = member.getMember_meeting_keepalive(); // 멤버 테이블에서 가져온 레코드 중 하나의 keepalive 컬럼의 엔티티를 저장
			
			int comparison = 1;  
			if(memberKeepAlive!= null) {
				comparison=nowMinus5.compareTo(memberKeepAlive);// 가져온 멤버쪽의 keepAlive값이 null이면 그냥 연결 해제 처리(1~)
			}
			
			System.out.println("비교결과(1이면 현재시간으로부터 5초 전이 현재 멤버의 keepalive 값보다 이후의 시간대 ) : "+ comparison);
			if (comparison <= 0) {
			    System.out.println(member.getMember_id()+": 현재시간으로부터 5초 전이 현재 멤버의 keepalive 값보다 이전의 시간대(연결상태로 간주)");
			} else {
			    System.out.println(member.getMember_id()+": 현재시간으로부터 5초 전이 현재 멤버의 keepalive 값보다 이후의 시간대(연결해제 됨)");
			    // 화상회의룸에서 제거
			    meetingRoomService.updateMyNowRoomState(member.getMember_id(), null);
			    //keepAlive 값 제거
			    meetingRoomService.updateKeepAlive(member.getMember_id(), null);
			    meetingRoomService.updateMeetingNowNum(Integer.parseInt(member.getMember_nowRoom_code()),member.getMember_nowRoom_code()); //미팅룸 현재 참여자수 갱신
			} 
		
		}
		
	}
	
	
}
