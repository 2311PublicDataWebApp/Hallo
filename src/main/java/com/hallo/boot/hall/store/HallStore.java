package com.hallo.boot.hall.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.hallo.boot.hall.domain.vo.HallImgVO;
import com.hallo.boot.hall.domain.vo.HallVO;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;

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

	
	
	///////////////////////////////Admin 시작 //////////////////////////////
	List<HallVO> selectAdminHallList(SqlSession session, QnaPageInfo pInfo);

	int getAdminHallTotalCount(SqlSession session, Map<String, String> paramMap);

	List<HallVO> searchAdminHallByKeyword(SqlSession session, QnaPageInfo pInfo, Map<String, String> paramMap);

	//0330 추가분
	int insertImgHall(SqlSession session, HallImgVO hallImg);

	int updateHallImg(SqlSession session, HallImgVO hallImg);

	HallVO selectByHallNo(SqlSession session, int hallNo);

	HallImgVO selectByHallImgNo(SqlSession session, int hallNo);

	HallVO selectAdminHallByNo(SqlSession session, int hallNo);

}
