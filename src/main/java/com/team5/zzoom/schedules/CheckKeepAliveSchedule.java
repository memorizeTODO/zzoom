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
		System.out.println("scheduler start");
		List<MemberDTO> memberList= null;
		Timestamp nowMinus3 = new Timestamp(System.currentTimeMillis()-5000);
		
		
		memberList= meetingRoomService.getAllMemberKeepAlive();
		System.out.println("success0 : "+ memberList);
		
		for (MemberDTO member : memberList) {
			System.out.println("success1 : "+ member);
			Timestamp memberKeepAlive  = member.getMember_meeting_keepalive(); // 멤버 테이블에서 가져온 레코드 중 하나의 keepalive 컬럼의 엔티티를 저장
			
			int comparison = 1;  
			if(memberKeepAlive!= null) {
				comparison=nowMinus3.compareTo(memberKeepAlive);// 가져온 멤버쪽의 keepAlive값이 null이면 그냥 연결 해제 처리(1~)
			}
			
			System.out.println("success2 : "+ comparison);
			if (comparison <= 0) {
			    System.out.println("nowMinus3(현재 시간으로부터 5초전)은 memberKeepAlive와 같거나 이전 시간을 나타냅니다.(연결상태로 간주)");
			} else {
			    System.out.println("nowMinus3(현재 시간으로부터 5초전)은 memberKeepAlive보다 이후의 시간을 나타냅니다.(연결해제 됨)");
			    // 화상회의룸에서 제거
			    meetingRoomService.updateMyNowRoomState(member.getMember_id(), null);
			    //keepAlive 값 제거
			    meetingRoomService.updateKeepAlive(member.getMember_id(), null);
			    meetingRoomService.updateMeetingNowNum(Integer.parseInt(member.getMember_nowRoom_code()),member.getMember_nowRoom_code()); //미팅룸 현재 참여자수 갱신
			} 
		
		}
		
	}
	
	
}
