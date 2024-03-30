package com.hallo.boot.qna.service;

import java.util.List;
import java.util.Map;

import com.hallo.boot.booking.domain.vo.BookingVO;
import com.hallo.boot.hall.domain.vo.HallVO;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;
import com.hallo.boot.qna.domain.vo.QnaVO;

public interface QnaService {

		int insertQna(QnaVO qna);

		int getTotalCount();

		List<QnaVO> selectmyQnaList(String memberId, QnaPageInfo pInfo);

		QnaVO selectQnaByNo(int qnaNo);

		int deleteQna(int qnaNo);

		String getOneById(String memberId);

		int modifyQna(QnaVO qna);

		int getqnaCount(String memberId);

		
		
		
		
		
		////////// Admin Q&A 시작
		List<QnaVO> selectAdminQnaList(QnaPageInfo pInfo);

		int adminModifyQna(QnaVO qna);

		QnaVO selectAdminQnaByNo(int qnaNo);

		int getAdminQnaTotalCount(Map<String, String> paramMap);

		List<QnaVO> searchAdminQnaByKeyword(QnaPageInfo pInfo, Map<String, String> paramMap);

		List<QnaVO> selectDBQnaList(NoticePageInfo pi);





}
