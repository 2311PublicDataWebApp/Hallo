package com.hallo.boot.booking.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.hallo.boot.booking.domain.vo.BookingVO;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;

import lombok.NonNull;

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
	 * @param rowBounds 
	 * @return List<BookingVO>
	 */
	List<BookingVO> selectBookingList(SqlSession session);
	List<BookingVO> selectBookingList(SqlSession session, RowBounds rowBounds);

	/**
	 * 예약 등록 Store
	 * @param session
	 * @param booking
	 * @return int
	 */
	BookingVO insertBooking(SqlSession session, BookingVO booking);

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

	/**
	 * 총 이용시간 계산 Store
	 * @param session
	 * @param bookingNo
	 * @return Integer
	 */
	Integer getTotalTime(SqlSession session, @NonNull Integer bookingNo);

	/**
	 * 예약 개수 Store
	 * @param session
	 * @return int
	 */
	int getTotalCount(SqlSession session);

////////////////////////////ADMIN 코드 시작 /////////////////////
	int selectTotalCount(SqlSession session);

	int getAdminBookingTotalCount(SqlSession session, Map<String, String> paramMap);

	List<BookingVO> searchAdminBookingByKeyword(SqlSession session, QnaPageInfo pInfo, Map<String, String> paramMap);

	List<BookingVO> selectAdminBookingList(SqlSession session, QnaPageInfo pInfo);

	BookingVO selectAdminBookingByNo(SqlSession session, int bookingNo);

	int deleteAdminBooking(SqlSession session, int bookingNo);

	int modifyAdminBook(SqlSession session, BookingVO booking);

	List<BookingVO> selectDBBookList(SqlSession session, NoticePageInfo pi);





}
