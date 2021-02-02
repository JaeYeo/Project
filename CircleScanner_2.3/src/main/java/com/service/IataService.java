package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.IataDAO;
import com.dto.AirlineDTO;
import com.dto.AirportDTO;

@Service
public class IataService {
	@Autowired
	private IataDAO dao;

	public String selectIata(String aname) {
		// SearchServlet
		String iata_a = dao.selectIata(aname);
		return iata_a;
	}

	//항공사
	public String selectAirlineNameKorean(String aCode) {
		// FlightConfirmServlet .1 airline name korean
		String Airline_K = dao.selectAirlineNameKorean(aCode);
		return Airline_K;
	}
	
	//항공사
	public AirlineDTO selectAirline(String aCode) {
		// FlightConfirmServlet .1 airline name korean
		AirlineDTO airlineDTO = dao.selectAirline(aCode);
		return airlineDTO;
	}
	
	
	//공항
	public AirportDTO selectAirportNameKorean(String IATA_A) {
		// FlightConfirmServlet .2 Airport name Korean
		AirportDTO Airport_Names = dao.selectAirportNameKorean(IATA_A);
		return Airport_Names;
	}
}
