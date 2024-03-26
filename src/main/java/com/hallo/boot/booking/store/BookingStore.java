package com.hallo.boot.booking.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hallo.boot.booking.domain.vo.BookingVO;

public interface BookingStore {

	/**
	 * 예약 조회 Store
	 * @param session
	 * @param bookingNo
	 * @return BookingVO
	 */
	BookingVO selectOneByNo(SqlSession session, Integer bookingNo);

	/**
	 * 예약 목록 조회 Store
	 * @param session
	 * @return List<BookingVO>
	 */
	List<BookingVO> selectBookingList(SqlSession session);

	/**
	 * 예약 등록 Store
	 * @param session
	 * @param booking
	 * @return int
	 */
	int insertBooking(SqlSession session, BookingVO booking);

	/**
	 * 예약 수정 Store
	 * @param session
	 * @param booking
	 * @return int
	 */
	int updateBooking(SqlSession session, BookingVO booking);

	/**
	 * 예약 삭제 Store
	 * @param session
	 * @param bookingNo
	 * @return int
	 */
	int deleteBooking(SqlSession session, Integer bookingNo);

}
