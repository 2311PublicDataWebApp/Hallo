package com.hallo.boot.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hallo.boot.map.domain.vo.MapVO;
import com.hallo.boot.map.service.MapService;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;

@Controller
public class MapController {
	
	@Autowired
	private MapService mapService;
	

	// 지도
	@GetMapping("/map.do")
    public ModelAndView ShowHallList(ModelAndView mv,
            @RequestParam(value="page", 
            required=false, defaultValue="1") Integer currentPage) {
		try {
			int totalCount = mapService.getTotalCount();
			NoticePageInfo pi = this.getPageInfo(currentPage, totalCount);
			List<MapVO> mList = mapService.selectHallList(pi);
			List<MapVO> allList = mapService.selectHallList();
			mv.addObject("allList", allList);
			mv.addObject("mList", mList);
			mv.addObject("pi", pi);
			mv.setViewName("map/map");
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
    };
    
    private NoticePageInfo getPageInfo(Integer currentPage, int totalCount) {
		NoticePageInfo pi = null;
		int boardLimit = 5; // 한 페이지당 보여줄 게시물의 갯수
		int naviLimit = 5; 	 // 한 페이지당 보여줄 범위의 갯수
		int naviTotalCount; 		 // 범위의 총 갯수
		int startNavi;
		int endNavi;
		
		naviTotalCount = (int)((double) totalCount / boardLimit + 0.9);
		startNavi = (((int)((double) currentPage / naviLimit + 0.9)) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pi = new NoticePageInfo(currentPage, totalCount, naviTotalCount, boardLimit, naviLimit, startNavi,
				endNavi);
		return pi;
	}
}
