package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ReservationDAO;
import com.dto.ReservationDTO;

@Service
public class ReservationService {
	@Autowired
	private ReservationDAO dao;
	
	public String getReservation_Id(String RESERVATION_DATE) {
		String reservation_id = dao.getReservation_Id(RESERVATION_DATE);
		return reservation_id;
	}

	public int updateReservation(ReservationDTO rdto) {
		int n = dao.updateReservation( rdto);
		return n;
	}

}
