package com.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

//by jungwoo 20201201
@Alias("PassportInfoDTO")
@Data
public class PassportInfoDTO {
	private String p_passportNum;
	private String RESERVATION_ID;
	private String p_lastname;
	private String p_firstname;
	private String p_sex;
	private String p_birthday;
	private String p_passportExpirationdate;
	private String p_nationality;
	private String p_issuecountry;
	private List<PassportInfoDTO> list_PassportInfoDTO;
}
