package com.hallo.boot.map.service.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hallo.boot.map.domain.vo.MapVO;
import com.hallo.boot.map.service.MapService;
import com.hallo.boot.map.store.MapStore;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;

@Service
public class MapServiceLogic implements MapService {
	
	@Autowired
	private MapStore mapStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		int totalCount = mapStore.selectTotalCount(session);
		return totalCount;
	}

	@Override
	public List<MapVO> selectHallList(NoticePageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MapVO> mList = mapStore.selectNoticeList(session, rowBounds);
		return mList;
	}

}
