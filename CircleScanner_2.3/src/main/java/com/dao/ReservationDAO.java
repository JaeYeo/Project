package com.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ReservationDTO;

@Repository
public class ReservationDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	public String getReservation_Id(String RESERVATION_DATE) {
		// 예약번호 생성후 예약번호 가져오기
		System.out.println("dao===="+RESERVATION_DATE);
		int n = template.insert("ReservationMapper.insertReservation_Id", RESERVATION_DATE);
		System.out.println(n);
		String RESERVATION_ID = template.selectOne("ReservationMapper.selectRESERVATION_ID", RESERVATION_DATE);
		System.out.println("dao===="+RESERVATION_ID);
		return RESERVATION_ID;
	}

	public int updateReservation(ReservationDTO rdto) {
		int n = template.update("ReservationMapper.updateReservation", rdto);
		System.out.println(n);
		return n;
	}

}
