package com.team5.zzoom.controller;

import org.springframework.stereotype.Controller;	 
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team5.zzoom.model.MemberDTO;
import com.team5.zzoom.service.MemberDAOImpl;

import com.team5.zzoom.model.ReservationDTO;
import com.team5.zzoom.service.ReservationDAOImpl;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



@RestController
public class meetingController {
	
	@Autowired
	ReservationDAOImpl ReservationService;

	@Autowired
	private MemberDAOImpl service;
	
	@RequestMapping("/get/meetingroom")
    public Map<String,Object> getReservationToView(@RequestParam Map<String,String> params){
    	
    	String code = params.get("code");
    	Map<String,Object> ReservationMap = new HashMap<String,Object>(); 
    	ReservationDTO wDTO = ReservationService.getReservation(code);

    	
    		try {
				BeanUtils.populate(ReservationMap, BeanUtils.describe(wDTO));
				System.out.println(ReservationMap.get("meeting_id"));
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
    	return ReservationMap;
    }
	

    
  
    
    @RequestMapping("get/meetinglist")
	public Map<String,Map<String,Object>> getReservaionListToView(@RequestParam Map<String,String> params){
	Map<String,Map<String,Object>> ReservationMaps = new HashMap<String,Map<String,Object>>();
		
	String ID = params.get("memberID");
	Map<String,Object> ReservationMap= new HashMap<String,Object>(); 
	List<ReservationDTO> RList = ReservationService.getReservationList(ID);
	
	System.out.println(RList.toString());

	for(int i=0;i<RList.size();i++ ) {
		try {
			ReservationMap = new HashMap<String,Object>();
			BeanUtils.populate(ReservationMap, BeanUtils.describe(RList.get(i)));
			System.out.println(ReservationMap.toString());

			ReservationMaps.put("item"+i, ReservationMap);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			continue;
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			continue;
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			continue;
		}

	}
	return ReservationMaps;
	}
    
    
    
    @PostMapping("/update-meeting")
    	public ResponseEntity<String> updateMeeting(@RequestBody ReservationDTO dto){
    		
    		int result = ReservationService.updateReservation(dto);
    	
    		if (result == 1) {
    			System.out.println(dto);
		        return ResponseEntity.ok("Meeting updated successfully.");
		        
		    } else {
		        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to updated meeting.");
		    }
    	
    	}
    
    @RequestMapping("/delete-meeting")
    public void deleteReservation(@RequestParam Map<String,String> params){
    	
    	String code = params.get("code");
		ReservationService.deleteReservation(code);
	
    }
    
    	
    	@PostMapping("/create-meeting")
    		public ResponseEntity<String> createMeeting(@RequestBody ReservationDTO dto) {
    		    // DTO를 DAO에 전달하여 데이터베이스에 삽입
    		    int result = ReservationService.insertReservation(dto);

    		    // 삽입 결과에 따라 응답 반환
    		    if (result == 1) {
    		        return ResponseEntity.ok("Meeting created successfully.");
    		    } else {
    		        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to create meeting.");
    		    }
    		}
    	
}
		
    	
    	
    	
    	
    
    
    
    
    
    
    
