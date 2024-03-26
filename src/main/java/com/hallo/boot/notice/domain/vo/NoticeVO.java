package com.hallo.boot.notice.domain.vo;

import java.sql.Date;
import java.sql.Timestamp;

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
public class NoticeVO {
	private Integer noticeNo;
	@NonNull
	private String noticeSubject;
	@NonNull
	private String noticeContent;
	@NonNull
	private String noticeWriter;
	private Date noticeDate;
	private Timestamp updateDate;
	private String noticeFileName;
	private String noticeFileRename;
	private String noticeFilePath;
	private long noticeFileLength;
}