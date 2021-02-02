package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("SelectBtnDTO")
@Data
public class SelectBtnDTO {
	private String i;
	private String list_D_priceFormat;
	private String list_A_priceFormat;
	private String total_priceFormat;
	private String totalPriceInt;
	private String totalPrice;
	
}
