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

	@GetMapping("/qna/regist.do")
	public String showQnaForm() {
		return "qna/regist";

	}

	// Q&A 등록
	@PostMapping("/qna/regist.do")
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
				return "redirect:/qna/list.do";
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
	@RequestMapping(value = "/qna/detail.do", method = RequestMethod.GET)
	public ModelAndView showQnaDetail(ModelAndView mv, int qnaNo) {
		try {
			QnaVO qna = qService.selectQnaByNo(qnaNo);
			if (qna != null) {
				mv.addObject("qna", qna).setViewName("qna/detail");
			} else {
				mv.addObject("msg", "데이터가 존재하지 않습니다.").setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}

	// Q&A 삭제
	@GetMapping("/qna/delete.do")
	public ModelAndView deleteQna(ModelAndView mv, int qnaNo) {
		try {
			int result = qService.deleteQna(qnaNo);
			if (result > 0) {
				mv.setViewName("redirect:/qna/list.do");
			} else {
				mv.addObject("msg", "데이터가 조회되지 않습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}

	// Q&A 리스트
	@GetMapping("/qna/list.do")
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
				mv.setViewName("qna/list");
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
	@GetMapping("/qna/modify.do")
	public ModelAndView showModifyForm(ModelAndView mv, int qnaNo) {
		try {
			QnaVO qna = qService.selectQnaByNo(qnaNo);
			if(qna != null) {
				mv.addObject("qna", qna);
				mv.setViewName("qna/modify");
			}else {
				mv.addObject("msg", "11데이터가 존재하지 않았습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	

	@PostMapping("/qna/modify.do")
	public ModelAndView modifyQna(
			ModelAndView mv
			, @ModelAttribute QnaVO qna
			, HttpServletRequest request) {
		try {
			int result = qService.modifyQna(qna);
			if(result > 0) {
				mv.setViewName("redirect:/qna/detail.do?qnaNo="+qna.getQnaNo());
			}else {
				mv.addObject("msg", "22데이터가 존재하지 않습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch(Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
		
		
		
		
////////////////////////		ADMIN 코드 시작 /////////////////////////////////////
		
		

	//ADMIN_Q&A_조회_리스트
	@GetMapping("/admin/qnaAdminList.do")
	public ModelAndView showQnaAdminList(ModelAndView mv
			,@RequestParam(value="page", required=false, defaultValue="1") 
				Integer currentPage
				,HttpSession session) {
		try {
			int totalCount = qService.getTotalCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<QnaVO> qList = qService.selectAdminQnaList(pInfo);
			mv.addObject("qList", qList);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pInfo", pInfo);
			mv.setViewName("admin/qnaAdminList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
		

	
	
	
}
