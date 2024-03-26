package com.hallo.boot.hall.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hallo.boot.hall.domain.vo.HallVO;
import com.hallo.boot.hall.store.HallStore;

@Repository
public class HallStoreLogic implements HallStore {

	@Override
	public HallVO selectOneByNo(SqlSession session, Integer hallNo) {
		HallVO hall = session.selectOne("HallMapper.selectOneByNo", hallNo);
		return hall;
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

}
