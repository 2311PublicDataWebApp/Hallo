package com.hallo.boot.qna.service;

import java.util.List;

import com.hallo.boot.qna.domain.vo.PageInfo;
import com.hallo.boot.qna.domain.vo.QnaVO;

public interface QnaService {

		int insertQna(QnaVO qna);

		int getTotalCount();

		List<QnaVO> selectmyQnaList(String memberId,PageInfo pInfo);

		QnaVO selectQnaByNo(int qnaNo);

		int deleteQna(int qnaNo);

		String getOneById(String memberId);

		int modifyQna(QnaVO qna);

		int getqnaCount(String memberId);


}
