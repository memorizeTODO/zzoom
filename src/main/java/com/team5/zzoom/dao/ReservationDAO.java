package com.team5.zzoom.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team5.zzoom.model.ReservationDTO;

	
	@Mapper
	public interface ReservationDAO {
		public int insertReservation(ReservationDTO dto); 
		public void deleteReservation(String ID); 
		public int updateReservation(ReservationDTO dto);
		public ReservationDTO getReservation(String ID); 
		public List<ReservationDTO> getReservationList(String ID);
		
	}
	
