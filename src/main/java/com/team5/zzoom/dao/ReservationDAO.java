package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.ReservationDTO;
	
	@Mapper
	public interface ReservationDAO {
		public int insertReservation(ReservationDTO w); 
		public int updateReservation(ReservationDTO w);
		public ReservationDTO getReservation(String code);
		public List<ReservationDTO> getReservationList();
	}
	
