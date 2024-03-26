package com.hallo.boot.hall.service.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hallo.boot.common.Pagination;
import com.hallo.boot.hall.domain.vo.HallVO;
import com.hallo.boot.hall.service.HallService;
import com.hallo.boot.hall.store.HallStore;

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

}
