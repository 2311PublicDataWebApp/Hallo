package com.hallo.boot.hall.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hallo.boot.common.Pagination;
import com.hallo.boot.hall.domain.vo.HallImgVO;
import com.hallo.boot.hall.domain.vo.HallVO;
import com.hallo.boot.hall.service.HallService;

@Controller
public class HallController {

	@Autowired
	private HallService hService;
	
	@GetMapping("/hall/detail.do")
	public String showHallDetail(Model model, Integer hallNo) {
		try {
			HallVO hall = hService.selectOneByNo(hallNo);
			HallImgVO hThumbnail = hService.selectThumbnail(hallNo);
			List<HallImgVO> hImgs = hService.selectImgs(hallNo);
			if (hall != null && hThumbnail != null && hImgs != null) {
				List<String> cautions = arrayToList(hall.getHallCautions());
				List<String> refunds = arrayToList(hall.getHallRefunds());
				model.addAttribute("cautions", cautions);
				model.addAttribute("refunds", refunds);
				model.addAttribute("hall", hall);
				model.addAttribute("hThumbnail", hThumbnail);
				model.addAttribute("hImgs", hImgs);
				return "hall/detail";
			} else {
				model.addAttribute("msg", "No Data Found");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/hall/list.do")
	public String showHallList(Model model
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			int boardLimit = 10;
			int totalCount = hService.getTotalCount();
			Pagination pi = new Pagination(currentPage, totalCount, boardLimit);
			List<HallVO> hList = hService.selectHallList(pi);
			if (hList != null) {
				model.addAttribute("hList", hList);
				model.addAttribute("pi", pi);
				return "hall/list";
			} else {
				model.addAttribute("msg", "No Data Found");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/hall/insert.do")
	public String showInsertHall() {
		return "hall/insert";
	}
	
	@PostMapping("/hall/insert.do")
	public String insertHall(Model model, HallVO hall) {
		try {
			int result = hService.insertHall(hall);
			if (result > 0) {
				return "redirect:/";
			} else {
				model.addAttribute("msg", "등록 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/hall/update.do")
	public String showUpdateHall(Model model, Integer hallNo) {
		try {
			HallVO hall = hService.selectOneByNo(hallNo);
			if (hall != null) {
				model.addAttribute("hall", hall);
				return "hall/update";
			} else {
				model.addAttribute("msg", "조회 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@PostMapping("/hall/update.do")
	public String updateHall(Model model, HallVO hall) {
		try {
			int result = hService.updateHall(hall);
			if (result > 0) {
				HallVO hOne = hService.selectOneByNo(hall.getHallNo());
				if (hOne != null) {
					model.addAttribute("hall", hOne);
					return "hall/detail";					
				} else {
					model.addAttribute("msg", "No Data Found");
					return "common/errorPage";
				}
			} else {
				model.addAttribute("msg", "수정 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/hall/delete.do")
	public String deleteHall(Model model, Integer hallNo) {
		try {
			int result = hService.deleteHall(hallNo);
			if (result > 0) {
				return "redirect:/";
			} else {
				model.addAttribute("msg", "삭제 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	private List<String> arrayToList(String string) {
		String[] strArray = string.split("\\^");
		List<String> strList = new ArrayList<String>();
		for (String str : strArray) {
			strList.add(str);
		}
		return strList;
	}
	
}
