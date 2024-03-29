package com.hallo.boot.qna.domain.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.AllArgsConstructor;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class QnaPageInfo {
	private int currentPage;
	private int totalCount;
	private int naviTotalCount;
	private int recordCountPerPage;
	private int naviCountPerPage;
	private int startNavi;
	private int endNavi;
	
	public QnaPageInfo() {
		this.recordCountPerPage = 10;
		this.naviCountPerPage = 10;
	}
}
