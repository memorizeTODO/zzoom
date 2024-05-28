package com.team5.zzoom.schedules;

import java.time.LocalDateTime;
import java.util.List;
  
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.team5.zzoom.model.MeetingRoomDTO; 
import com.team5.zzoom.service.MeetingRoomDAOImpl;
@Component  
public class AutoDeleteRoomSchedule {
	@Autowired 
	MeetingRoomDAOImpl meetingRoomService;
	//매일 자정 1분 후에 작동
	@Scheduled(cron = "0/10 * * * * ?")
	public void autoDelete() { 
		
		
		System.out.println("기간이 만료된 회의룸 자동 삭제 스케쥴러 가동");
		
		LocalDateTime now =LocalDateTime.now();
		LocalDateTime yesterday = now.minusDays(1);

        // 하루를 뺍니다.
        List<MeetingRoomDTO> meetingRoomList = null;
        meetingRoomList= meetingRoomService.getAllMeetingRoom();
        
        if (meetingRoomList==null) {
        	return; // 생성되어있는 방이 아예 없으면 스케쥴러 종료
        }
        
        for(MeetingRoomDTO meetingRoom : meetingRoomList) {
	        if(meetingRoom.getMeeting_start_date() == null){
	        	//해당 meeting레코드 삭제
	        	meetingRoomService.deleteMeetingRoom(meetingRoom.getMeeting_id());
		        continue;
	        }
	        if (yesterday.isBefore(meetingRoom.getMeeting_start_date())) {
	            System.out.println("yesterday은 meetingRoomStartDate보다 이전입니다. pass");
	            
	        } else {
	            System.out.println("yesterday은 meetingRoomStartDate보다 이후이거나 동일한 시간입니다. 해당 레코드(회의룸)를 삭제합니다");
	          //해당 meeting레코드 삭제
	            meetingRoomService.deleteMeetingRoom(meetingRoom.getMeeting_id());
	        } 
        }
	}	
}
	
	

 