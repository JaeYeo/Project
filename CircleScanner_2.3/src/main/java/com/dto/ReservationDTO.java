package com.dto;

import java.util.List;

import lombok.Data;

//by jungwoo 20201201
@Data
public class ReservationDTO {
	private String reservation_ID;
	private String reservation_Name;
	private String reservation_Email;
	private String reservation_phone;
	private int totalPriceInt;
	private String payState;
	private String reservation_Date;
	private List<PassportInfoDTO> list_PassportInfoDTO;

}
