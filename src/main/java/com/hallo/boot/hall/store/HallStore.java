package com.hallo.boot.hall.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.hallo.boot.hall.domain.vo.HallVO;

public interface HallStore {

	/**
	 * 공연장 조회 Store
	 * @param session
	 * @param hallNo
	 * @return HallVO
	 */
	HallVO selectOneByNo(SqlSession session, Integer hallNo);

	/**
	 * 공연장 목록 조회 Store
	 * @param session
	 * @param rowBounds 
	 * @return List<HallVO>
	 */
	List<HallVO> selectHallList(SqlSession session, RowBounds rowBounds);

	/**
	 * 공연장 등록 Store
	 * @param session
	 * @param hall
	 * @return int
	 */
	int insertHall(SqlSession session, HallVO hall);

	/**
	 * 공연장 수정 Store
	 * @param session
	 * @param hall
	 * @return int
	 */
	int updateHall(SqlSession session, HallVO hall);

	/**
	 * 공연장 삭제 Store
	 * @param session
	 * @param hallNo
	 * @return int
	 */
	int deleteHall(SqlSession session, Integer hallNo);

	/**
	 * 공연장 개수 Store
	 * @param session
	 * @return int
	 */
	int getTotalCount(SqlSession session);

}
