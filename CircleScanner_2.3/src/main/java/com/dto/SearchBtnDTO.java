package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("SearchBtnDTO")
@Data
public class SearchBtnDTO {
	private String tripType;
	private String originPlace;
	private String destinationPlace;
	private String outboundPartialDate;
	private String inboundPartialDate;
	private String non_stop;
	private String seatGrade;
	private String passenger;
	private int passengerInt;
	
}
