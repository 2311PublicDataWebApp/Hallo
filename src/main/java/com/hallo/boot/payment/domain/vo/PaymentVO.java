package com.hallo.boot.payment.domain.vo;

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
public class PaymentVO {
	@NonNull
	private Integer paymentNo;
	@NonNull
	private String howToPay;
	@NonNull
	private Integer totalPrice;
	@NonNull
	private Timestamp paymentDate;
	@NonNull
	private String memberId;
	@NonNull
	private Integer bookingNo;
}
