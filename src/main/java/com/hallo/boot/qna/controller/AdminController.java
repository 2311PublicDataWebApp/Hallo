package com.hallo.boot.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hallo.boot.booking.domain.vo.BookingVO;
import com.hallo.boot.booking.service.BookingService;
import com.hallo.boot.common.Pagination;
import com.hallo.boot.map.domain.vo.MapVO;
import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.member.service.MemberService;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;
import com.hallo.boot.notice.domain.vo.NoticeVO;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;
import com.hallo.boot.qna.domain.vo.QnaVO;
import com.hallo.boot.qna.service.QnaService;

@Controller
public class AdminController {

	@Autowired
	private MemberService mService;
	@Autowired
	private QnaService qService;
	@Autowired
	private BookingService bService;
	
////////////// 회원관리 ////////////// 회원관리 ////////////// 회원관리 ////////////// 회원관리 //////////////


	// ADMIN_MEMBER_조회_리스트
	@GetMapping("/admin/memberlist.do")
	public ModelAndView showMemberAdminList(ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage,
			HttpSession session) {
		try {
			int totalCount = mService.getAdminMemberTotalCount();
			QnaPageInfo pInfo = this.getQnaPageInfo(currentPage, totalCount);
			List<MemberVO> mList = mService.selectAdminMemberList(pInfo);
			mv.addObject("mList", mList);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pInfo", pInfo);
			mv.setViewName("admin/memberlist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 페이징 처리
	private QnaPageInfo getQnaPageInfo(Integer currentPage, int totalCount) {
		QnaPageInfo pi = null;
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
		pi = new QnaPageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi,
				endNavi);
		return pi;
	}

	// ADMIN_MEMBER_검색_리스트
	@PostMapping("/admin/membersearch.do")
	public ModelAndView searchMemberAdminList(ModelAndView mv, @RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("searchCondition", searchCondition);
			paramMap.put("searchKeyword", searchKeyword);
			int totalCount = mService.getMemberAdminTotalCount(paramMap);
			QnaPageInfo pInfo = this.getQnaPageInfo(currentPage, totalCount);
			List<MemberVO> searchList = mService.searchMemberAdminByKeyword(pInfo, paramMap);
			mv.addObject("searchList", searchList);
			mv.addObject("pInfo", pInfo);
			mv.addObject("totalCount", totalCount);
			mv.addObject("searchKeyword", searchKeyword);
			mv.addObject("searchCondition", searchCondition);
			mv.setViewName("admin/membersearch");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// ADMIN MEMBER Detail
	@GetMapping("/admin/memberAdminDetail.do")
	public ModelAndView showMemberDetailForm(ModelAndView mv, String memberId) {
		try {
			MemberVO member = mService.selectAdminMemberById(memberId);
			if (member != null) {
				mv.addObject("member", member);
				mv.setViewName("admin/memberAdminDetail");
			} else {
				mv.addObject("msg", "데이터가 존재하지 않았습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}


////////////// 1:1문의 ////////////// 1:1문의 ////////////// 1:1문의 ////////////// 1:1문의 //////////////

//ADMIN_Q&A_조회_리스트
	@GetMapping("/admin/qnalist.do")
	public ModelAndView showQnaAdminList(ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage,
			HttpSession session) {
		try {
			int totalCount = qService.getTotalCount();
			QnaPageInfo pInfo = this.getQnaPageInfo(currentPage, totalCount);
			List<QnaVO> qList = qService.selectAdminQnaList(pInfo);
			mv.addObject("qList", qList);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pInfo", pInfo);
			mv.setViewName("admin/qnalist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 검색 시 검색 결과 페이지
	@GetMapping("/admin/qnasearch.do")
	public ModelAndView searchAdminQnaList(ModelAndView mv,
			@RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("searchCondition", searchCondition);
			paramMap.put("searchKeyword", searchKeyword);
			int totalCount = qService.getAdminQnaTotalCount(paramMap);
			QnaPageInfo pInfo = this.getQnaPageInfo(currentPage, totalCount);
			List<QnaVO> searchList = qService.searchAdminQnaByKeyword(pInfo, paramMap);
			mv.addObject("searchList", searchList);
			mv.addObject("pInfo", pInfo);
			mv.addObject("totalCount", totalCount);
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchKeyword", searchKeyword);
			mv.setViewName("admin/qnasearch");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

//ADMIN Detail + 수정하기(답변달기)
	@GetMapping("/admin/qnaAdminDetail.do")
	public ModelAndView showDetailForm(ModelAndView mv, int qnaNo) {
		try {
			QnaVO qna = qService.selectAdminQnaByNo(qnaNo);
			if (qna != null) {
				mv.addObject("qna", qna);
				mv.setViewName("admin/qnaAdminDetail");
			} else {
				mv.addObject("msg", "데이터가 존재하지 않았습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//Q&A 상세페이지
	@PostMapping("/admin/qnaAdminDetail.do")
	public ModelAndView adminModifyQna(ModelAndView mv, @ModelAttribute QnaVO qna, HttpServletRequest request) {
		try {
			int result = qService.adminModifyQna(qna);
			if (result > 0) {
				mv.setViewName("redirect:/admin/qnaAdminDetail.do?qnaNo=" + qna.getQnaNo());
			} else {
				mv.addObject("msg", "데이터가 존재하지 않습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	
	
//////////////예약관리 ////////////// 예약관리 ////////////// 예약관리 ////////////// 예약관리 //////////////

	//예약 리스트
	@GetMapping("/admin/booklist.do")
	public ModelAndView showBookAdminList(ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage,
			HttpSession session) {
		try {
			int totalCount = bService.getTotalCount();
			QnaPageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<BookingVO> bList = bService.selectAdminBookingList(pInfo);
			mv.addObject("bList", bList);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pInfo", pInfo);
			mv.setViewName("admin/booklist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//getPageInfo
	private QnaPageInfo getPageInfo(Integer currentPage, int totalCount) {
		QnaPageInfo pInfo = null;
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
		pInfo = new QnaPageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		return pInfo;
	}

	//검색 시 이동 페이지
	@GetMapping("/admin/booksearch.do")
	public ModelAndView searchAdminBookList(ModelAndView mv,
			@RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("searchCondition", searchCondition);
			paramMap.put("searchKeyword", searchKeyword);
			int totalCount = bService.getAdminBookingTotalCount(paramMap);
			QnaPageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<BookingVO> searchList = bService.searchAdminBookingByKeyword(pInfo, paramMap);
			mv.addObject("searchList", searchList);
			mv.addObject("pInfo", pInfo);
			mv.addObject("totalCount", totalCount);
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchKeyword", searchKeyword);
			mv.setViewName("admin/booksearch");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
