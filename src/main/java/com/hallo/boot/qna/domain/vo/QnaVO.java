package com.hallo.boot.qna.domain.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class QnaVO {
	@NonNull
	private Integer qnaNo;
	@NonNull
	private String memberId;
	@NonNull
	private String qnaTitle;
	@NonNull
	private String qnaContent;
	@NonNull
	private String qnaPhone;
	@NonNull
	private Timestamp qnaDate;
	@NonNull
	private String qnaCategory;
	@NonNull
	private String qnaStatus;
	@NonNull
	private String qnaMembername;
	private String qnaCount;
}
