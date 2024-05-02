package com.team5.zzoom.controller;

/*import org.springframework.stereotype.Controller;	 
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team5.zzoom.model.ReservationDTO;
import com.team5.zzoom.service.ReservationDAOImpl;

import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/")
public class testcontroller{
	
	@Autowired
	ReservationDAOImpl ReservationService;

	@RequestMapping("get/room")
	
	public Map<String,Map<String,Object>> getReservaionListToView(){
		Map<String,Map<String,Object>> ReservationMaps = new HashMap<String,Map<String,Object>>();
		

	Map<String,Object> ReservationMap= new HashMap<String,Object>(); 
	List<ReservationDTO> RList = ReservationService.getReservationList();

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
	
		@RequestMapping("get/room")
		public Map<String,Object> getReservationToView(@RequestParam Map<String,String> params){
			
			String code =params.get("code");
			Map<String,Object> ReservationMap = new HashMap<String,Object>();; 
			ReservationDTO RDTO = ReservationService.getReservation(code);

	
		try {
			
			BeanUtils.populate(ReservationMap, BeanUtils.describe(RDTO));
			System.out.println(ReservationMap.toString());
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


}	
*/