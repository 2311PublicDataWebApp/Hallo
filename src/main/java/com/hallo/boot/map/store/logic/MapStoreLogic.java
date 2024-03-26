package com.hallo.boot.map.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hallo.boot.map.domain.vo.MapVO;
import com.hallo.boot.map.store.MapStore;
@Repository
public class MapStoreLogic implements MapStore {

	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("MapMapper.selectTotalCount");
		return totalCount;
	}

	@Override
	public List<MapVO> selectNoticeList(SqlSession session, RowBounds rowBounds) {
		List<MapVO> mList = session.selectList("MapMapper.selectMapList", null, rowBounds);
		return mList;
	}

}
