package com.hallo.boot.map.domain.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@ToString
public class MapVO {
	private Integer hallNo;
	@NonNull
	private String hallName;
	@NonNull
	private String hallSpaceName;
	@NonNull
	private String hallAddress;
	private String hallPeople;
	private String hallFee;
	private String hallCautions;
	private String hallRefunds;
	private String hallAgentName;
	private String hallAgentPhone;
	private String hallAgentEmail;
	private String hallX;
	private String hallY;
}
