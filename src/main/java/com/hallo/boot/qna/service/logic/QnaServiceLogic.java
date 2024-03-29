package com.hallo.boot.qna.service.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hallo.boot.common.Pagination;
import com.hallo.boot.map.domain.vo.MapVO;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;
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
		public List<QnaVO> selectmyQnaList(String memberId, QnaPageInfo pInfo) {
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

		
		
		
		////////////////////////// Admin 코드 시작
		@Override
		public List<QnaVO> selectAdminQnaList(QnaPageInfo pInfo) {
			List<QnaVO> qList = qStore.selectAdminQnaList(session,pInfo);
			return qList;
		}

		@Override
		public int adminModifyQna(QnaVO qna) {
			int result = qStore.adminModifyQna(session, qna);
			return result;
		}

		@Override
		public QnaVO selectAdminQnaByNo(int qnaNo) {
			QnaVO qna = qStore.selectAdminQnaByNo(session, qnaNo);
			return qna; 
		}

		@Override
		public int getAdminQnaTotalCount(Map<String, String> paramMap) {
			int totalCount = qStore.selectAdminQnaTotalCount(session, paramMap);
			return totalCount;
		}

		@Override
		public List<QnaVO> searchAdminQnaByKeyword(QnaPageInfo pInfo, Map<String, String> paramMap) {
			List<QnaVO> adminqnasearchqList = qStore.searchAdminQnaByKeyword(session, pInfo, paramMap);
			return adminqnasearchqList;
		}

		
		@Override
		public List<QnaVO> selectDBQnaList(NoticePageInfo pi) {
			int limit = pi.getBoardLimit();
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, limit);
			List<QnaVO> qList = qStore.selectDBQnaList(session, rowBounds);
			return qList;
		}


		

	
}
