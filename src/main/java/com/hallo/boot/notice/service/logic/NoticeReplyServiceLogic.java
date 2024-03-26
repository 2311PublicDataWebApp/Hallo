package com.hallo.boot.notice.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hallo.boot.notice.domain.vo.NoticeReplyVO;
import com.hallo.boot.notice.service.NoticeReplyService;
import com.hallo.boot.notice.store.NoticeReplyStore;

@Service
public class NoticeReplyServiceLogic implements NoticeReplyService{
	
	@Autowired
	private NoticeReplyStore rStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertReply(NoticeReplyVO replyVO) {
		int result = rStore.insertReply(session, replyVO);
		return result;
	}

	@Override
	public int deleteReply(Integer replyNo) {
		int result = rStore.deleteReply(session, replyNo);
		return result;
	}

	@Override
	public List<NoticeReplyVO> selectReplyList(Integer refNoticeNo) {
		List<NoticeReplyVO> rList = rStore.selectReplyList(session, refNoticeNo);
		return rList;
	}

	@Override
	public int updateReply(NoticeReplyVO reply) {
		int result = rStore.updateReply(session, reply);
		return result;
	}

	

	

}
