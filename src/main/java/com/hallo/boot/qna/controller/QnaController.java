package com.hallo.boot.qna.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.qna.domain.vo.PageInfo;
import com.hallo.boot.qna.domain.vo.QnaVO;
import com.hallo.boot.qna.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qService;

	@GetMapping("/qna/qnaregist.do")
	public String showQnaForm() {
		return "qna/qnaregist";

	}

	// Q&A 등록
	@PostMapping("/qna/qnaregist.do")
	public String insertQna(@ModelAttribute QnaVO qna, 
			Model model, HttpServletRequest request, HttpSession session) {
		try {
			String memberId = (String) session.getAttribute("memberId");
			if (session != null && memberId != null && !"".equals(memberId)) {
				qna.setMemberId(memberId);
			} else {
				return "redirect:/member/login.do";
			}
			int result = qService.insertQna(qna);
			if (result > 0) {
				return "redirect:/qna/qnalist.do";
			} else {
				model.addAttribute("msg", "문의 등록이 완료되지 않았습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// Q&A 상세
	@RequestMapping(value = "/qna/qnadetail.do", method = RequestMethod.GET)
	public ModelAndView showQnaDetail(ModelAndView mv, int qnaNo) {
		try {
			QnaVO qna = qService.selectQnaByNo(qnaNo);
			if (qna != null) {
				mv.addObject("qna", qna).setViewName("qna/qnadetail");
			} else {
				mv.addObject("msg", "데이터가 존재하지 않습니다.").setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}

	// Q&A 삭제
	@GetMapping("/qna/qnadelete.do")
	public ModelAndView deleteQna(ModelAndView mv, int qnaNo) {
		try {
			int result = qService.deleteQna(qnaNo);
			if (result > 0) {
				mv.setViewName("redirect:/qna/qnalist.do");
			} else {
				mv.addObject("msg", "데이터가 조회되지 않습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}

//	// Q&A 리스트
//	@GetMapping("/qna/qnalist.do")
//	public ModelAndView showQnaList(ModelAndView mv,
//			Model model,
//			@RequestParam(value = "page", required = false, defaultValue = "10") Integer currentPage) {
//		try {
//			int totalCount = qService.getTotalCount();
//			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
//			List<QnaVO> myqList = qService.selectmyQnaList(pInfo);
////
////			if (!myqList.isEmpty()) {
//				mv.addObject("myqList", myqList);
//				mv.addObject("pInfo", pInfo);
//				mv.setViewName("qna/qnalist");
////			}
////			else {
////				model.addAttribute("qlistCheck", "empty");
////			}
//
//		} catch (Exception e) {
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("common/errorPage");
//		}
//		return mv;
//	}
//
	// Q&A 리스트
	@GetMapping("/qna/qnalist.do")
		public ModelAndView showQnaList(ModelAndView mv
				,@RequestParam(value="page", required=false, defaultValue="1") 
					Integer currentPage
					,HttpSession session) {
			try {
				String memberId = (String) session.getAttribute("memberId");
				int totalCount = qService.getTotalCount();
				int mytotalCount = qService.getqnaCount(memberId);
				PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
				List<QnaVO> qList = qService.selectmyQnaList(memberId, pInfo);
				mv.addObject("qList", qList);
				mv.addObject("mytotalCount", mytotalCount);
				mv.addObject("pInfo", pInfo);
				mv.setViewName("qna/qnalist");
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
	
	
	
	
	// 페이징 처리
	private PageInfo getPageInfo(Integer currentPage, int totalCount) {
		PageInfo pi = null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int naviTotalCount;
		int startNavi;
		int endNavi;

		naviTotalCount = (int) ((double) totalCount / recordCountPerPage + 0.9);
		startNavi = (((int) ((double) currentPage / naviCountPerPage + 0.9)) - 1) * naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage - 1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pi = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi,
				endNavi);
		return pi;
	}

	//문의 수정s
	@GetMapping("/qna/qnamodify.do")
	public ModelAndView showModifyForm(ModelAndView mv, int qnaNo) {
		try {
			QnaVO qna = qService.selectQnaByNo(qnaNo);
			if(qna != null) {
				mv.addObject("qna", qna);
				mv.setViewName("qna/qnamodify");
			}else {
				mv.addObject("msg", "데이터가 존재하지 않았습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	

		@PostMapping("/qna/qnamodify.do")
		public ModelAndView modifyQna(
				ModelAndView mv
				, @ModelAttribute QnaVO qna
				, HttpServletRequest request) {
			try {
				int result = qService.modifyQna(qna);
				if(result > 0) {
					mv.setViewName("redirect:/qna/qnadetail.do?qnaNo="+qna.getQnaNo());
				}else {
					mv.addObject("msg", "데이터가 존재하지 않습니다.");
					mv.setViewName("common/errorPage");
				}
			} catch(Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
	
	
	
	
	
	
	
	
}
