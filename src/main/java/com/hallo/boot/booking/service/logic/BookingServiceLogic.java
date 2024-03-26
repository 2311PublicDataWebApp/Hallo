package com.hallo.boot.booking.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hallo.boot.booking.domain.vo.BookingVO;
import com.hallo.boot.booking.service.BookingService;
import com.hallo.boot.booking.store.BookingStore;

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
	public int insertBooking(BookingVO booking) {
		int result = bStore.insertBooking(session, booking);
		return result;
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

}
