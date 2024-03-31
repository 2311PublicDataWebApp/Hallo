package com.hallo.boot.booking.service;

import java.util.List;
import java.util.Map;

import com.hallo.boot.booking.domain.vo.BookingVO;
import com.hallo.boot.common.Pagination;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;

import lombok.NonNull;

public interface BookingService {

	/**
	 * 예약 조회 Service
	 * @param bookingNo
	 * @return BookingVO
	 */
	BookingVO selectOneByNo(Integer bookingNo);

	/**
	 * 예약 목록 조회 Service
	 * @param pi 
	 * @return List<BookingVO>
	 */
	List<BookingVO> selectBookingList();
	
	/**
	 * 해당 공연장 예약 목록 Service
	 * @param hallNo
	 * @return
	 */
	List<BookingVO> selectBookingList(Integer hallNo);
	
	List<BookingVO> selectBookingList(Pagination pi);

	/**
	 * 예약 등록 Service
	 * @param booking
	 * @return int
	 */
	BookingVO insertBooking(BookingVO booking);

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

	/**
	 * 총 이용시간 계산 Service
	 * @param bookingNo
	 * @return Integer
	 */
	Integer getTotalTime(@NonNull Integer bookingNo);
	
	/**
	 * 예약 개수 Service
	 * @return int
	 */
	int getTotalCount1();

//////////////////////////ADMIN 코드 ////////////////////////////////////
	int getTotalCount();
	
	int getAdminBookingTotalCount(Map<String, String> paramMap);

	List<BookingVO> searchAdminBookingByKeyword(QnaPageInfo pInfo, Map<String, String> paramMap);

	List<BookingVO> selectAdminBookingList(QnaPageInfo pInfo);

	BookingVO selectAdminBookingByNo(int bookingNo);

	int deleteAdminBooking(int bookingNo);

	int modifyAdminBook(BookingVO booking);

	List<BookingVO> selectDBBookList(NoticePageInfo pi);





}
