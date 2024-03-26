package com.hallo.boot.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hallo.boot.notice.domain.vo.NoticeReplyVO;
import com.hallo.boot.notice.store.NoticeReplyStore;

@Repository
public class NoticeReplyStoreLogic implements NoticeReplyStore{

	@Override
	public int insertReply(SqlSession session, NoticeReplyVO replyVO) {
		int result = session.insert("NoticeReplyMapper.insertReply" , replyVO);
		return result;
	}

	@Override
	public int deleteReply(SqlSession session, Integer replyNo) {
		int result = session.delete("NoticeReplyMapper.deleteReply" , replyNo);
		return result;
	}

	@Override
	public List<NoticeReplyVO> selectReplyList(SqlSession session, Integer refNoticeNo) {
		List<NoticeReplyVO> rList = session.selectList("NoticeReplyMapper.selectReplyList", refNoticeNo);
		return rList;
	}

	@Override
	public int updateReply(SqlSession session, NoticeReplyVO reply) {
		int result = session.update("NoticeReplyMapper.updateReply" , reply);
		return result;
	}

	

	
	
	
}
