package com.hallo.boot.qna.store;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hallo.boot.qna.domain.vo.PageInfo;
import com.hallo.boot.qna.domain.vo.QnaVO;

public interface QnaStore {
	
	
	int insertQna(SqlSession session, QnaVO qna);

	List<QnaVO> selectmyQnaList(SqlSession session, String memberId, PageInfo pInfo);

	int selectTotalCount(SqlSession session);

	QnaVO selectQnaByNo(SqlSession session, int qnaNo);

	int deleteQna(int qnaNo);

	QnaVO selectOneById(SqlSession session, String memberId);

	int modifyQna(SqlSession session, QnaVO qna);

	int selectqnaCount(String memberId);

}
