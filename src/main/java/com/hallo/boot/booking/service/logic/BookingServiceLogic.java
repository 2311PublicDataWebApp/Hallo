package com.hallo.boot.booking.service.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hallo.boot.booking.domain.vo.BookingVO;
import com.hallo.boot.booking.service.BookingService;
import com.hallo.boot.booking.store.BookingStore;
import com.hallo.boot.common.Pagination;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;

import lombok.NonNull;

@Service
public class BookingServiceLogic implements BookingService {

	@Autowired
	private BookingStore bStore;
	@Autowired
	private SqlSession session;

	@Override
	public BookingVO selectOneByNo(Integer bookingNo) {
		BookingVO booking = bStore.selectOneByNo(session, bookingNo);
		return booking;
	}

	@Override
	public List<BookingVO> selectBookingList() {
		List<BookingVO> bList = bStore.selectBookingList(session);
		return bList;
	}

	@Override
	public List<BookingVO> selectBookingList(Pagination pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<BookingVO> bList = bStore.selectBookingList(session, rowBounds);
		return bList;
	}

	@Override
	public BookingVO insertBooking(BookingVO booking) {
		BookingVO bOne = bStore.insertBooking(session, booking);
		return bOne;
	}

	@Override
	public int updateBooking(BookingVO booking) {
		int result = bStore.updateBooking(session, booking);
		return result;
	}

	@Override
	public int deleteBooking(Integer bookingNo) {
		int result = bStore.deleteBooking(session, bookingNo);
		return result;
	}

	@Override
	public Integer getTotalTime(@NonNull Integer bookingNo) {
		Integer totalTime = bStore.getTotalTime(session, bookingNo);
		return totalTime;
	}

	@Override
	public int getTotalCount1() {
		int totalCount = bStore.getTotalCount(session);
		return totalCount;
	}

////////////////////////////ADMIN 코드 시작 /////////////////////
	@Override
	public int getTotalCount() {
		int totalCount = bStore.selectTotalCount(session);
		return totalCount;
	}

	@Override
	public int getAdminBookingTotalCount(Map<String, String> paramMap) {
		int totalCount = bStore.getAdminBookingTotalCount(session, paramMap);
		return totalCount;
	}

	@Override
	public List<BookingVO> searchAdminBookingByKeyword(QnaPageInfo pInfo, Map<String, String> paramMap) {
		List<BookingVO> bList = bStore.searchAdminBookingByKeyword(session, pInfo, paramMap);
		return bList;
	}

	@Override
	public List<BookingVO> selectAdminBookingList(QnaPageInfo pInfo) {
		List<BookingVO> bList = bStore.selectAdminBookingList(session, pInfo);
		return bList;
	}

}
