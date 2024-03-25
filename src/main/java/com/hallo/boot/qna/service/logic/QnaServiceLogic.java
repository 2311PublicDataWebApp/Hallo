package com.hallo.boot.qna.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hallo.boot.qna.domain.vo.PageInfo;
import com.hallo.boot.qna.domain.vo.QnaVO;
import com.hallo.boot.qna.service.QnaService;
import com.hallo.boot.qna.store.QnaStore;

@Service
public class QnaServiceLogic implements QnaService{

		
		@Autowired
		private QnaStore qStore;
		@Autowired
		private SqlSession session;

		@Override
		public int insertQna(QnaVO qna) {
			int result = qStore.insertQna(session, qna);
			return result;
		}

		@Override
		public int getTotalCount() {
			int totalCount = qStore.selectTotalCount(session);
			return totalCount;
		}

		@Override
		public List<QnaVO> selectmyQnaList(String memberId,PageInfo pInfo) {
			List<QnaVO> qList = qStore.selectmyQnaList(session, memberId, pInfo);
			return qList;
		}

		@Override
		public QnaVO selectQnaByNo(int qnaNo) {
			QnaVO qna = qStore.selectQnaByNo(session, qnaNo);
			return qna;
		}

		@Override
		public int deleteQna(int qnaNo) {
			int result = qStore.deleteQna(qnaNo);
			return result;
		}

		@Override
		public String getOneById(String memberId) {
			QnaVO member = qStore.selectOneById(session, memberId);
			return member.getMemberId();
		}

		
		@Override
		public int modifyQna(QnaVO qna) {
			int result = qStore.modifyQna(session, qna);
			return result;
		}

		@Override
		public int getqnaCount(String memberId) {
			int mytotalCount = qStore.selectqnaCount(memberId);
			return mytotalCount;
		}

		

	
}
