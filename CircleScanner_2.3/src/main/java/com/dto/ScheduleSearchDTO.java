package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("ScheduleSearchDTO")
@Data
public class ScheduleSearchDTO {
	// 항공권 검색을 위한 객체 생성
	private String SCHEDULE_ID;
	private String DEPARTURE_ACODE;
	private String DESTINATION_ACODE;
	private String DEPART_DATE;
	private String ARRIVE_DATE;
	private String AIRLINE_NAME;
	private String AIRCRAFT_NAME;
	private String PRICE;
	private String DURATION_OF_TIME;


}
