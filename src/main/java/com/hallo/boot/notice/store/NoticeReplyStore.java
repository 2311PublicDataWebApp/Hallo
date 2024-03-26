package com.hallo.boot.notice.store;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.SqlSession;

import com.hallo.boot.notice.domain.vo.NoticeReplyVO;


public interface NoticeReplyStore {
	
	int insertReply(SqlSession session, NoticeReplyVO replyVO);
	
	int deleteReply(SqlSession session, Integer replyNo);

	List<NoticeReplyVO> selectReplyList(SqlSession session, Integer refNoticeNo);
	
	int updateReply(SqlSession session, NoticeReplyVO reply);

	

}
