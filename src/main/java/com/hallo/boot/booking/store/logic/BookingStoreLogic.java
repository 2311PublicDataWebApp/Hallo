package com.hallo.boot.booking.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hallo.boot.booking.domain.vo.BookingVO;
import com.hallo.boot.booking.store.BookingStore;

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
	public int insertBooking(SqlSession session, BookingVO booking) {
		int result = session.insert("BookingMapper.insertBooking", booking);
		return result;
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

}
