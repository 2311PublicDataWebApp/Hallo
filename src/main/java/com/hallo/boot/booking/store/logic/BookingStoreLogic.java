package com.hallo.boot.booking.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hallo.boot.booking.domain.vo.BookingVO;
import com.hallo.boot.booking.store.BookingStore;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;
import com.hallo.boot.notice.domain.vo.NoticeVO;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;

import lombok.NonNull;

@Repository
public class BookingStoreLogic implements BookingStore {

	@Override
	public BookingVO selectOneByNo(SqlSession session, Integer bookingNo) {
		BookingVO booking = session.selectOne("BookingMapper.selectOneByNo", bookingNo);
		return booking;
	}

	@Override
	public List<BookingVO> selectBookingList(SqlSession session) {
		List<BookingVO> bList = session.selectList("BookingMapper.selectBookingList");
		return bList;
	}

	@Override
	public List<BookingVO> selectBookingList(SqlSession session, RowBounds rowBounds) {
		List<BookingVO> bList = session.selectList("BookingMapper.selectBookingList", null, rowBounds);
		return bList;
	}

	@Override
	public BookingVO insertBooking(SqlSession session, BookingVO booking) {
		session.insert("BookingMapper.insertBooking", booking);
		return booking;
	}

	@Override
	public int updateBooking(SqlSession session, BookingVO booking) {
		int result = session.update("BookingMapper.insertBooking", booking);
		return result;
	}

	@Override
	public int deleteBooking(SqlSession session, Integer bookingNo) {
		int result = session.delete("BookingMapper.insertBooking", bookingNo);
		return result;
	}

	@Override
	public Integer getTotalTime(SqlSession session, @NonNull Integer bookingNo) {
		Integer totalTime = session.selectOne("BookingMapper.getTotalTime", bookingNo);
		return totalTime;
	}

	@Override
	public int getTotalCount(SqlSession session) {
		int totalCount = session.selectOne("BookingMapper.getTotalCount");
		return totalCount;
	}

////////////////////////////ADMIN 코드 시작 /////////////////////
	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("BookingMapper.selectTotalCount");
		return totalCount;
	}

	@Override
	public int getAdminBookingTotalCount(SqlSession session, Map<String, String> paramMap) {
		int totalCount = session.selectOne("BookingMapper.AdminBookingTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public List<BookingVO> searchAdminBookingByKeyword(SqlSession session, QnaPageInfo pInfo,
			Map<String, String> paramMap) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<BookingVO> bList = session.selectList("BookingMapper.searchAdminBookingByKeyword", paramMap, rowBounds);
		return bList;
	}

	@Override
	public List<BookingVO> selectAdminBookingList(SqlSession session, QnaPageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<BookingVO> bList = session.selectList("BookingMapper.selectAdminBookingList", null, rowBounds);
		return bList;
	}

	@Override
	public BookingVO selectAdminBookingByNo(SqlSession session, int bookingNo) {
		BookingVO booking = session.selectOne("BookingMapper.selectAdminBookingByNo", bookingNo);
		return booking;
	}

	@Override
	public int deleteAdminBooking(SqlSession session, int bookingNo) {
			int result = session.delete("BookingMapper.deleteAdminBooking", bookingNo);
			return result;
		
	}

	@Override
	public int modifyAdminBook(SqlSession session, BookingVO booking) {
		int result = session.update("BookingMapper.modifyAdminBooking", booking);
		return result;
	}

	@Override
	public List<BookingVO> selectDBBookList(SqlSession session, NoticePageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<BookingVO> bList = session.selectList("BookingMapper.selectDBBookingList", null, rowBounds);
		return bList;
	}




}
