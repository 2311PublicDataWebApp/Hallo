package com.hallo.boot.booking.service;

import java.util.List;

import com.hallo.boot.booking.domain.vo.BookingVO;

public interface BookingService {

	/**
	 * 예약 조회 Service
	 * @param bookingNo
	 * @return BookingVO
	 */
	BookingVO selectOneByNo(Integer bookingNo);

	/**
	 * 예약 목록 조회 Service
	 * @return List<BookingVO>
	 */
	List<BookingVO> selectBookingList();

	/**
	 * 예약 등록 Service
	 * @param booking
	 * @return int
	 */
	int insertBooking(BookingVO booking);

	/**
	 * 예약 수정 Service
	 * @param booking
	 * @return int
	 */
	int updateBooking(BookingVO booking);

	/**
	 * 예약 삭제 Service
	 * @param bookingNo
	 * @return int
	 */
	int deleteBooking(Integer bookingNo);

}
