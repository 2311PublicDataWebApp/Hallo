package com.hallo.boot.map.service;

import java.util.List;

import com.hallo.boot.map.domain.vo.MapVO;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;

public interface MapService {

	int getTotalCount();

	List<MapVO> selectHallList(NoticePageInfo pInfo);

}
