package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SearchDTO")
public class SearchDTO {

	private String originPlaceAcode;
	private String destinationPlaceAcode;
	private String outboundPartialDate;
	private String inboundPartialDate;

	public SearchDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SearchDTO(String originPlaceAcode, String destinationPlaceAcode, String outboundPartialDate,
			String inboundPartialDate) {
		super();
		this.originPlaceAcode = originPlaceAcode;
		this.destinationPlaceAcode = destinationPlaceAcode;
		this.outboundPartialDate = outboundPartialDate;
		this.inboundPartialDate = inboundPartialDate;
	}

	public String getOriginPlaceAcode() {
		return originPlaceAcode;
	}

	public void setOriginPlaceAcode(String originPlaceAcode) {
		this.originPlaceAcode = originPlaceAcode;
	}

	public String getDestinationPlaceAcode() {
		return destinationPlaceAcode;
	}

	public void setDestinationPlaceAcode(String destinationPlaceAcode) {
		this.destinationPlaceAcode = destinationPlaceAcode;
	}

	public String getOutboundPartialDate() {
		return outboundPartialDate;
	}

	public void setOutboundPartialDate(String outboundPartialDate) {
		this.outboundPartialDate = outboundPartialDate;
	}

	public String getInboundPartialDate() {
		return inboundPartialDate;
	}

	public void setInboundPartialDate(String inboundPartialDate) {
		this.inboundPartialDate = inboundPartialDate;
	}

	@Override
	public String toString() {
		return "SearchDTO [originPlaceAcode=" + originPlaceAcode + ", destinationPlaceAcode=" + destinationPlaceAcode
				+ ", outboundPartialDate=" + outboundPartialDate + ", inboundPartialDate=" + inboundPartialDate + "]";
	}

}
