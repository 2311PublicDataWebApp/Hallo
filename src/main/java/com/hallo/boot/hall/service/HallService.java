package com.hallo.boot.hall.service;

import java.util.List;
import java.util.Map;

import com.hallo.boot.common.Pagination;
import com.hallo.boot.hall.domain.vo.HallImgVO;
import com.hallo.boot.hall.domain.vo.HallVO;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;

public interface HallService {

	/**
	 * 공연장 조회 Service
	 * @param hallNo
	 * @return HallVO
	 */
	HallVO selectOneByNo(Integer hallNo);

	/**
	 * 공연장 대표 사진 Service
	 * @param hallNo
	 * @return HallImgVO
	 */
	HallImgVO selectThumbnail(Integer hallNo);
	
	/**
	 * 공연장 사진 조회 Service
	 * @param hallNo
	 * @return HallImgVO
	 */
	List<HallImgVO> selectImgs(Integer hallNo);

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
	 * 공연장 등록 후 공연장 번호 반환 Service
	 * @param session
	 * @param hall
	 * @return HallVO
	 */
	HallVO insertHallSelectKey(HallVO hall);

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

	
	
	
	
	///////////////////////////////Admin 시작 //////////////////////////////
	List<HallVO> selectAdminHallList(QnaPageInfo pInfo);

	int getAdminHallTotalCount(Map<String, String> paramMap);

	List<HallVO> searchAdminHallByKeyword(QnaPageInfo pInfo, Map<String, String> paramMap);

	//0330 추가분
	HallVO selectByHallNo(int hallNo);

	int insertImgHall(HallImgVO hallImg);

	int updateHallImg(HallImgVO hallImg);

	HallImgVO selectByHallImgNo(int hallNo);

	HallVO selectAdminHallByNo(int hallNo);

}
