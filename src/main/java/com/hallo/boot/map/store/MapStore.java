package com.hallo.boot.map.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.hallo.boot.map.domain.vo.MapVO;

public interface MapStore {

	int selectTotalCount(SqlSession session);

	List<MapVO> selectMapList(SqlSession session, RowBounds rowBounds);

	List<MapVO> selectMapList(SqlSession session);

}
