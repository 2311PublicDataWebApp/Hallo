package com.hallo.boot.booking.domain.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BookingVO {
	@NonNull
	private Integer bookingNo;
	@NonNull
	private Timestamp bookingStartTime;
	@NonNull
	private Timestamp bookingEndTime;
	@NonNull
	private Integer paymentNo;
	@NonNull
	private String memberId;
	@NonNull
	private Integer hallNo;
}
