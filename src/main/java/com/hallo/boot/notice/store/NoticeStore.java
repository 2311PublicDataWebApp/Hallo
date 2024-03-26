package com.hallo.boot.notice.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.hallo.boot.notice.domain.vo.NoticeVO;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;

public interface NoticeStore {


	List<NoticeVO> selectNoticeList(SqlSession session, NoticePageInfo pi);
	
	int selectTotalCount(SqlSession session);
	
	int selectTotalCount(SqlSession session, Map<String, String> paramMap);
	

	
	List<NoticeVO> selectNoticesByKeyword(SqlSession session, RowBounds rowBounds, Map<String, String> paramMap);
	
	NoticeVO selectByNoticeNo(SqlSession session, int noticeNo);
	
	int updateNotice(SqlSession session, NoticeVO notice);
	
	
	int deleteNotice(SqlSession session, int noticeNo);
	
	int insertNotice(SqlSession session, NoticeVO notice);	
}
