package com.hallo.boot.member.domain.vo;

import java.sql.Date;

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
public class MemberVO {
	@NonNull
	private String memberId;
	@NonNull
	private String memberPw;
	@NonNull
	private String memberName;
	@NonNull
	private String memberAddress;
	@NonNull
	private String memberEmail;
	@NonNull
	private String memberPhone;
	private Date memberDate;
}
