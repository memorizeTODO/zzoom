package com.team5.zzoom.service;

import java.util.List;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import lombok.RequiredArgsConstructor;
import com.team5.zzoom.dao.ReservationDAO;
import com.team5.zzoom.model.ReservationDTO;

	@Service
	public class ReservationDAOImpl implements ReservationDAO {
		@Autowired
		private ReservationDAO dao;
		
		public int insertReservation(ReservationDTO w) {
		    try {
		        // insert 쿼리 실행
		        dao.insertReservation(w);
		        
		    } catch (PersistenceException e) {
		        // MyBatis의 PersistenceException 처리
		    	
		        return 0;
		    }
		    return 1;
		}
		
		public List<ReservationDTO> getReservationList() {
			
			 
			return dao.getReservationList();
			
		}
		public ReservationDTO getReservation(String code) {

			return dao.getReservation(code);
			
		}
	    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
		public int updateReservation(ReservationDTO w) {
	    	try {
		        // insert 쿼리 실행
	    		dao.updateReservation(w);
		        
		    } catch (PersistenceException e) {
		        // MyBatis의 PersistenceException 처리
		        return 0;
		    }
	    	
	    	return 1;
		}

}

