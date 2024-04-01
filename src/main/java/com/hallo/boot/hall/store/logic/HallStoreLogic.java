package com.hallo.boot.hall.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hallo.boot.hall.domain.vo.HallImgVO;
import com.hallo.boot.hall.domain.vo.HallVO;
import com.hallo.boot.hall.store.HallStore;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;

@Repository
public class HallStoreLogic implements HallStore {

	@Override
	public HallVO selectOneByNo(SqlSession session, Integer hallNo) {
		HallVO hall = session.selectOne("HallMapper.selectOneByNo", hallNo);
		return hall;
	}

	@Override
	public HallImgVO selectThumbnail(SqlSession session, Integer hallNo) {
		HallImgVO hThumbnail = session.selectOne("HallMapper.selectThumbnail", hallNo);
		return hThumbnail;
	}

	@Override
	public List<HallImgVO> selectImgs(SqlSession session, Integer hallNo) {
		List<HallImgVO> hImgs = session.selectList("HallMapper.selectImgs", hallNo);
		return hImgs;
	}

	@Override
	public List<HallVO> selectHallList(SqlSession session, RowBounds rowBounds) {
		List<HallVO> hList = session.selectList("HallMapper.selectHallList", null, rowBounds);
		return hList;
	}

	@Override
	public int insertHall(SqlSession session, HallVO hall) {
		int result = session.insert("HallMapper.insertHall", hall);
		return result;
	}
	@Override
	public HallVO insertHallSelectKey(SqlSession session, HallVO hall) {
		session.insert("HallMapper.insertHall", hall);
		return hall;
	}

	@Override
	public int updateHall(SqlSession session, HallVO hall) {
		int result = session.update("HallMapper.updateHall", hall);
		return result;
	}

	@Override
	public int deleteHall(SqlSession session, Integer hallNo) {
		int result = session.delete("HallMapper.deleteHall", hallNo);
		return result;
	}

	@Override
	public int getTotalCount(SqlSession session) {
		int totalCount = session.selectOne("HallMapper.getTotalCount");
		return totalCount;
	}

	
	
	
	///////////////////////////////Admin 시작 //////////////////////////////
	@Override
	public List<HallVO> selectAdminHallList(SqlSession session, QnaPageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<HallVO> hList = session.selectList("HallMapper.selectAdminHallList", null, rowBounds);
		return hList;
	}

	@Override
	public int getAdminHallTotalCount(SqlSession session, Map<String, String> paramMap) {
		int totalCount = session.selectOne("HallMapper.AdminHallTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public List<HallVO> searchAdminHallByKeyword(SqlSession session, QnaPageInfo pInfo, Map<String, String> paramMap) {
	int limit = pInfo.getRecordCountPerPage();
	int offset = (pInfo.getCurrentPage() - 1) * limit;
	RowBounds rowBounds = new RowBounds(offset, limit);
	List<HallVO> hList = session.selectList("HallMapper.searchAdminHallByKeyword", paramMap, rowBounds);
	return hList;
	}

	//0330추가분
	@Override
	public HallVO selectByHallNo(SqlSession session, int hallNo) {
		HallVO hall = session.selectOne("HallMapper.selectByAdminHallNo", hallNo);
		return hall;
	}

	@Override
	public int insertImgHall(SqlSession session, HallImgVO hallImg) {
		int result = session.insert("HallMapper.insertImgHall", hallImg);
		return result;
	}

	@Override
	public void insertImgHallTh(SqlSession session, HallImgVO hImage) {
		session.insert("HallMapper.insertImgHallThumbnail", hImage);
	}

	@Override
	public int updateHallImg(SqlSession session, HallImgVO hallImg) {
		int result = session.update("HallMapper.updateHallImg", hallImg);
		return result;
	}

	@Override
	public HallImgVO selectByHallImgNo(SqlSession session, int hallNo) {
		HallImgVO hallImg = session.selectOne("HallMapper.selectByHallImgNo", hallNo);
		return hallImg;
	}

	@Override
	public HallVO selectAdminHallByNo(SqlSession session, int hallNo) {
		HallVO hall = session.selectOne("HallMapper.selectAdminHallByNo", hallNo);
		return hall;
	}



}
