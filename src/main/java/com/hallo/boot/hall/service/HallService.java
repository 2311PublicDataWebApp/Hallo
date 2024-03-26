package com.hallo.boot.hall.service;

import java.util.List;

import com.hallo.boot.common.Pagination;
import com.hallo.boot.hall.domain.vo.HallVO;

public interface HallService {

	/**
	 * 공연장 조회 Service
	 * @param hallNo
	 * @return HallVO
	 */
	HallVO selectOneByNo(Integer hallNo);

	/**
	 * 공연장 목록 조회 Service
	 * @param pi 
	 * @return List<HallVO>
	 */
	List<HallVO> selectHallList(Pagination pi);

	/**
	 * 공연장 등록 Service
	 * @param hall
	 * @return int
	 */
	int insertHall(HallVO hall);

	/**
	 * 공연장 수정 Service
	 * @param hall
	 * @return int
	 */
	int updateHall(HallVO hall);

	/**
	 * 공연장 삭제 Service
	 * @param hallNo
	 * @return int
	 */
	int deleteHall(Integer hallNo);

	/**
	 * 공연장 개수 Service
	 * @return int
	 */
	int getTotalCount();

}
