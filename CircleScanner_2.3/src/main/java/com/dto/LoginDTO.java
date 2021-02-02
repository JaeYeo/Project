package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("LoginDTO")
@Data
public class LoginDTO {
	private String guID;
	private String name;
	private String e_mail;
	private String phone;

}
