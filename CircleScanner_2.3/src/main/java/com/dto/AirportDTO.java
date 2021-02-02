package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("AirportDTO")
@Data
public class AirportDTO {
	private String ANAME_E;
	private String ANAME_K; 
	private String IATA_A; 
	private String ICAO_A; 
	private String AREA_A; 
	private String ACOUNTRY_E; 
	private String ACOUNTRY_K; 
	private String ACITY_E; 
	private String ACITY_K; 
}
