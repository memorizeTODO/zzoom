package com.team5.zzoom.schedules;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date; import java.util.List;
  
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.scheduling.annotation.Scheduled;
  
import com.team5.zzoom.model.MeetingRoomDTO; 
import com.team5.zzoom.service.MeetingRoomDAOImpl;
  
public class AutoDeleteRoomSchedule {
	@Autowired 
	MeetingRoomDAOImpl meetingRoomService;
	//매일 자정 1분 후에 작동
	@Scheduled(cron = "0 1 0 * * ?")
	public void autoDelete() { 
		Date nowMinus2d = new Date();// 현재시각으로부터 하루 전
		
		
		
		Calendar cal = Calendar.getInstance();
        cal.setTime(nowMinus2d);

        // 하루를 뺍니다.
        cal.add(Calendar.DAY_OF_MONTH, -2);
        nowMinus2d = cal.getTime();
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
	        if (nowMinus2d.before(meetingRoom.getMeeting_start_date())) {
	            System.out.println("nowMinus2d은 meetingRoomStartDate보다 이전입니다. pass");
	            
	        } else {
	            System.out.println("nowMinus2d은 meetingRoomStartDate보다 이후이거나 동일한 날짜로 삭제 대상입니다 ex: 시작일이 25일인 데이터는 27일 자정이 지나면 삭제됨");
	          //해당 meeting레코드 삭제
	            meetingRoomService.deleteMeetingRoom(meetingRoom.getMeeting_id());
	        } 
        }
	}	
}
	
	

 