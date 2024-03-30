package com.hallo.boot.hall.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class HallVO {
	@NonNull
	private Integer hallNo;
//	@NonNull
	private String hallName;
	private String hallSpaceName;
	@NonNull
	private String hallAddress;
	private Integer hallPeople;
	private Integer hallFee;
	private String hallCautions;
	private String hallRefunds;
	@NonNull
	private String hallAgentName;
	@NonNull
	private String hallAgentPhone;
	private String hallAgentEmail;
	private String hallX;
	private String hallY;
	@NonNull
	private int hallImgNo;
	@NonNull
	private String hallImgName;
	@NonNull
	private String hallImgRename;
	@NonNull
	private String hallImgFilepath;
	@NonNull
	private long hallFileLength;
	@NonNull
	private String hallImgIsthumbnail;
	
	
	
	
}
