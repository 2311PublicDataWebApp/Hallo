package com.hallo.boot.qna.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hallo.boot.qna.domain.vo.QnaPageInfo;
import com.hallo.boot.qna.domain.vo.QnaVO;
import com.hallo.boot.qna.store.QnaStore;

@Repository
public class QnaStoreLogic implements QnaStore{
	
	@Autowired
	private SqlSession session;
	//등록
	@Override
	public int insertQna(SqlSession session, QnaVO qna) {
		int result = session.insert("QnaMapper.insertQna", qna);
		return result;
	}
	
	//리스트 보기
	@Override
	public List<QnaVO> selectmyQnaList(SqlSession session, String memberId, QnaPageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<QnaVO> qList 
		= session.selectList("QnaMapper.selectmyQnaList", memberId, rowBounds);
		return qList;
	}
	
	//페이징
	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("QnaMapper.selectTotalCount");
		return totalCount;
	}
	
	//selectQnaByNo
	@Override
	public QnaVO selectQnaByNo(SqlSession session, int qnaNo) {
		QnaVO qna = session.selectOne("QnaMapper.selectQnaByNo", qnaNo);
		return qna;
	}

	//삭제
	@Override
	public int deleteQna(int qnaNo) {
		int result = session.delete("QnaMapper.deleteQna",qnaNo);
		return result;
	}

	//selectOneById
	@Override
	public QnaVO selectOneById(SqlSession session, String memberId) {
		QnaVO member 
		= session.selectOne("QnaMapper.selectOneById", memberId);
		return member;
	}
	
	
	//수정
	@Override
	public int modifyQna(SqlSession session, QnaVO qna) {
		int result = session.update("QnaMapper.updateQna", qna);
		return result;
	}

	@Override
	public int selectqnaCount(String memberId) {
		int mytotalCount = session.selectOne("QnaMapper.selectmyQnaCount",memberId);
		return mytotalCount;
	}
	
	
	
	
	/////////////////////////////////// Admin 코드 시작
	@Override
	public List<QnaVO> selectAdminQnaList(SqlSession session, QnaPageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<QnaVO> qList 
		= session.selectList("QnaMapper.selectAdminQnaList", null, rowBounds);
		return qList;
	}
	


		


}
