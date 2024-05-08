/*
 * package com.team5.zzoom.schedules;
 * 
 * import java.sql.Timestamp; import java.util.Date; import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.scheduling.annotation.Scheduled;
 * 
 * import com.team5.zzoom.model.MeetingRoomDTO; import
 * com.team5.zzoom.service.MeetingRoomDAOImpl;
 * 
 * public class AutoDeleteRoomSchedule {
 * 
 * @Autowired MeetingRoomDAOImpl meetingRoomService;
 * 
 * @Scheduled(cron = "* 0/10 * * * ?") public void autoDelete() { Date date =
 * new Date();// 현재시각으로부터 하루 전 date.setDate(d.getDate - 1);
 * 
 * List<MeetingRoomDTO> meetingRoomList = null; meetingRoomList =
 * meetingRoomService.getAllMeetingRoom(); if(meetingRoomList!=null) {
 * for(MeetingRoomDTO meetingRoom : meetingRoomList) { Timestamp
 * meetingRoomStartDate = meetingRoom.getMeeting_start_date(); int comparison =
 * 1; if(memberKeepAlive!= null) {
 * comparison=nowMinus3.compareTo(memberKeepAlive);// 가져온 멤버쪽의 keepAlive값이
 * null이면 그냥 연결 해제 처리(1~) }
 * 
 * System.out.println("success2 : "+ comparison); if (comparison <= 0) {
 * System.out.
 * println("nowMinus3(현재 시간으로부터 5초전)은 memberKeepAlive와 같거나 이전 시간을 나타냅니다.(연결상태로 간주)"
 * ); } else { System.out.
 * println("nowMinus3(현재 시간으로부터 5초전)은 memberKeepAlive보다 이후의 시간을 나타냅니다.(연결해제 됨)"
 * ); // 화상회의룸에서 제거
 * meetingRoomService.updateMyNowRoomState(member.getMember_id(), null);
 * //keepAlive 값 제거 meetingRoomService.updateKeepAlive(member.getMember_id(),
 * null); meetingRoomService.updateMeetingNowNum(Integer.parseInt(member.
 * getMember_nowRoom_code()),member.getMember_nowRoom_code()); //미팅룸 현재 참여자수 갱신
 * } }
 * 
 * } }
 * 
 * }
 */