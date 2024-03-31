package com.hallo.boot.hall.service.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hallo.boot.common.Pagination;
import com.hallo.boot.hall.domain.vo.HallImgVO;
import com.hallo.boot.hall.domain.vo.HallVO;
import com.hallo.boot.hall.service.HallService;
import com.hallo.boot.hall.store.HallStore;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;

@Service
public class HallServiceLogic implements HallService {
	
	@Autowired
	private HallStore hStore;
	@Autowired
	private SqlSession session;

	@Override
	public HallVO selectOneByNo(Integer hallNo) {
		HallVO hall = hStore.selectOneByNo(session, hallNo);
		return hall;
	}

	@Override
	public HallImgVO selectThumbnail(Integer hallNo) {
		HallImgVO hThumbnail = hStore.selectThumbnail(session, hallNo);
		return hThumbnail;
	}

	@Override
	public List<HallImgVO> selectImgs(Integer hallNo) {
		List<HallImgVO> hImgs = hStore.selectImgs(session, hallNo);
		return hImgs;
	}

	@Override
	public List<HallVO> selectHallList(Pagination pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<HallVO> hList = hStore.selectHallList(session, rowBounds);
		return hList;
	}

	@Override
	public int insertHall(HallVO hall) {
		int result = hStore.insertHall(session, hall);
		return result;
	}
	
	@Override
	public HallVO insertHallSelectKey(HallVO hall) {
		HallVO hOne = hStore.insertHallSelectKey(session, hall);
		return hOne;
	}

	@Override
	public int updateHall(HallVO hall) {
		int result = hStore.updateHall(session, hall);
		return result;
	}

	@Override
	public int deleteHall(Integer hallNo) {
		int result = hStore.deleteHall(session, hallNo);
		return result;
	}

	@Override
	public int getTotalCount() {
		int totalCount = hStore.getTotalCount(session);
		return totalCount;
	}

	
	///////////////////////////////Admin 시작 //////////////////////////////
	@Override
	public List<HallVO> selectAdminHallList(QnaPageInfo pInfo) {
		List<HallVO> bList = hStore.selectAdminHallList(session, pInfo);
		return bList;
	}

	@Override
	public int getAdminHallTotalCount(Map<String, String> paramMap) {
		int totalCount = hStore.getAdminHallTotalCount(session, paramMap);
		return totalCount;
	}

	@Override
	public List<HallVO> searchAdminHallByKeyword(QnaPageInfo pInfo, Map<String, String> paramMap) {
		List<HallVO> bList = hStore.searchAdminHallByKeyword(session, pInfo, paramMap);
		return bList;
	}
	//0330 추가분
	@Override
	public HallVO selectByHallNo(int hallNo) {
		HallVO hall = hStore.selectByHallNo(session, hallNo);
		return hall;
	}

	@Override
	public int insertImgHall(HallImgVO hallImg) {
		int result = hStore.insertImgHall(session, hallImg);
		return result;
	}

	@Override
	public int updateHallImg(HallImgVO hallImg) {
		int result = hStore.updateHallImg(session, hallImg);
		return result;
	}

	@Override
	public HallImgVO selectByHallImgNo(int hallNo) {
		HallImgVO hallImg = hStore.selectByHallImgNo(session, hallNo);
		return hallImg;
	}

	@Override
	public HallVO selectAdminHallByNo(int hallNo) {
		HallVO hall =  hStore.selectAdminHallByNo(session, hallNo);
		return hall;
	}


	
	
	
	
	
	
	
}
