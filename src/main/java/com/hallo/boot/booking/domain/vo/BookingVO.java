package com.hallo.boot.booking.domain.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@NoArgsConstructor
@RequiredArgsConstructor
public class BookingVO {
	@NonNull
	private Integer bookingNo;
	@NonNull
	private Timestamp bookingStartTime;
	@NonNull
	private Timestamp bookingEndTime;
	@NonNull
	private String memberId;
	@NonNull
	private Integer hallNo;
	private String startTime;
	private String endTime;
	private Integer totalTime;
////////////////////////////ADMIN 코드 시작 /////////////////////
	private String memberName;
	private String memberPhone;
	private String hallName;
	private String hallSpaceName;
	private String hallAddress;

}
