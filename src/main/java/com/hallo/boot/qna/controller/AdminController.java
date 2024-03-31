package com.hallo.boot.qna.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hallo.boot.booking.domain.vo.BookingVO;
import com.hallo.boot.booking.service.BookingService;
import com.hallo.boot.hall.domain.vo.HallImgVO;
import com.hallo.boot.hall.domain.vo.HallVO;
import com.hallo.boot.hall.service.HallService;
import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.member.service.MemberService;
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
	///0329 이후 추가
	@Autowired
	private HallService hService;
	
	
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

////////////// Q&A ////////////// Q&A ////////////// Q&A ////////////// Q&A //////////////

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
	public ModelAndView searchAdminQnaList(ModelAndView mv, @RequestParam("searchCondition") String searchCondition,
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
	@GetMapping("/admin/qnaDetail.do")
	public ModelAndView showDetailForm(ModelAndView mv, int qnaNo) {
		try {
			QnaVO qna = qService.selectAdminQnaByNo(qnaNo);
			if (qna != null) {
				mv.addObject("qna", qna);
				mv.setViewName("admin/qnaDetail");
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

	// Q&A 상세페이지
	@PostMapping("/admin/qnaModify.do")
	public ModelAndView adminModifyQna(ModelAndView mv, @ModelAttribute QnaVO qna, HttpServletRequest request) {
		try {
			int result = qService.adminModifyQna(qna);
			if (result > 0) {
				mv.setViewName("redirect:/admin/qnaDetail.do?qnaNo=" + qna.getQnaNo());
			} else {
				mv.addObject("msg", "답변 등록에 실패하였습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

////////////////예약관리 ////////////// 예약관리 ////////////// 예약관리 ////////////// 예약관리 //////////////

	// 예약 리스트
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

	// getPageInfo
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
		pInfo = new QnaPageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage,
				startNavi, endNavi);
		return pInfo;
	}

	// 검색 시 이동 페이지
	@GetMapping("/admin/booksearch.do")
	public ModelAndView searchAdminBookList(ModelAndView mv, @RequestParam("searchCondition") String searchCondition,
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
	
	@GetMapping("/admin/bookDetail.do")
	public ModelAndView showAdminBookingDetailForm(ModelAndView mv,int bookingNo) {
		try {
			BookingVO book = bService.selectAdminBookingByNo(bookingNo);
			if (book != null) {
				mv.addObject("book", book);
				mv.setViewName("admin/bookDetail");
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
	
	 // 예약정보 페이지 이동
    @GetMapping("/admin/bookmodify.do")
    public ModelAndView adminModifyPage(ModelAndView mv, int bookingNo) {
		try {
			BookingVO book= bService.selectAdminBookingByNo(bookingNo);
			if (book != null) {
				mv.addObject("book", book);
				mv.setViewName("admin/bookmodify");
			} else {
				mv.addObject("msg", "데이터 불러오기가 완료되지 못했습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
    
//    // 예약정보 수정 정보 수정시 오류 발생합니다. 확인 부탁드립니다.
//    @PostMapping("/admin/bookmodify.do")
//	public ModelAndView modifyAdminBook(
//			ModelAndView mv
//			, @ModelAttribute BookingVO booking
//			, HttpServletRequest request) {
//		try {
//			int result = bService.modifyAdminBook(booking);
//			if(result > 0) {
//				mv.setViewName("redirect:/admin/bookdetail.do?bookingNo="+booking.getBookingNo());
//			}else {
//				mv.addObject("msg", "데이터가 존재하지 않습니다.");
//				mv.setViewName("common/errorPage");
//			}
//		} catch(Exception e) {
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("common/errorPage");
//		}
//		return mv;
//	}
//    
//예약정보 삭제
    @GetMapping("/admin/bookingdelete.do")
    public ModelAndView deleteBooking(ModelAndView mv, int bookingNo) {
		try {
			int result = bService.deleteAdminBooking(bookingNo);
			if (result > 0) {
				mv.setViewName("redirect:/admin/booklist.do");
			} else {
				mv.addObject("msg", "데이터가 존재하지 않습니다.").setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
   
	
	
	
	
//////////////// 공연장관리 ////////////// 공연장관리 ////////////// 공연장관리 ////////////// 공연장관리 //////////////

//공연장 리스트
	@GetMapping("/admin/hallList.do")
	public ModelAndView showHallAdminList(ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage,
			HttpSession session) {
		try {
			int totalCount = hService.getTotalCount();
			QnaPageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<HallVO> hList = hService.selectAdminHallList(pInfo);
			mv.addObject("hList", hList);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pInfo", pInfo);
			mv.setViewName("admin/hallList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}


//공연장 검색 시 이동 페이지
	@PostMapping("/admin/hallsearch.do")
	public ModelAndView searchAdminhallList(ModelAndView mv, 
			@RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("searchCondition", searchCondition);
			paramMap.put("searchKeyword", searchKeyword);
			int totalCount = hService.getAdminHallTotalCount(paramMap);
			QnaPageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<HallVO> searchList = hService.searchAdminHallByKeyword(pInfo, paramMap);
			mv.addObject("searchList", searchList);
			mv.addObject("pInfo", pInfo);
			mv.addObject("totalCount", totalCount);
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchKeyword", searchKeyword);
			mv.setViewName("admin/hallsearch");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	

//공연장 등록하기
			@GetMapping("/admin/hallregister.do")
			public String showWriteForm() {
				return "admin/hallregister";
			}
			
			@PostMapping("/admin/hallregister.do")
			public ModelAndView insertHallInfo(ModelAndView mv
					, @ModelAttribute HallVO hall,HttpSession session
					, @RequestParam(value = "uploadFile1", required = false) MultipartFile uploadFile1
					, @RequestParam(value = "uploadFile", required = false) List<MultipartFile> uploadFiles
					, HttpServletRequest request) {
				try {
					HallVO hOne = hService.insertHallSelectKey(hall);
					if (uploadFile1 != null && !uploadFile1.getOriginalFilename().equals("")) {
//						Map<String, Object> infoMap = this.savehallFile(uploadFile, request);
//						String fileName 	= (String) infoMap.get("fileName");
//						String fileRename 	= (String) infoMap.get("fileRename");
//						String filePath 	= (String) infoMap.get("filePath");
//						long fileLength 	= (long) infoMap.get("fileSize");
//						hall.setHallImgName(fileName);
//						hall.setHallImgRename(fileRename);
//						hall.setHallImgFilepath(filePath);
//						hall.setHallFileLength(fileLength);
						HallImgVO hImage = this.savehallFile(uploadFile1, request);
						hImage.setHallNo(hOne.getHallNo());
						hService.insertImgHall(hImage);
					}
					if (uploadFiles != null) {
						for (MultipartFile uploadFile : uploadFiles) {
							if (uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
								HallImgVO hImage = this.savehallFile(uploadFile, request);
								hImage.setHallNo(hOne.getHallNo());
								hService.insertImgHall(hImage);
							}
						}
					}
					if (hOne != null) {
						mv.setViewName("redirect:/admin/hallList.do");
					} else {
						mv.addObject("msg", "공연장 등록에 실패하였습니다.");
						mv.setViewName("common/errorPage");
					}
				} catch (Exception e) {
					mv.addObject("msg", e.getMessage());
					mv.setViewName("common/errorPage");
				}
				return mv;
			}
			
// 공연장 수정 페이지 이동
		    @GetMapping("/admin/hallmodify.do")
		    public ModelAndView adminHallModifyPage(ModelAndView mv, int hallNo) {
				try {
					HallVO hall = hService.selectByHallNo(hallNo);
					if (hall != null) {
						mv.addObject("hall", hall);
						mv.setViewName("admin/hallmodify");
					} else {
						mv.addObject("msg", "데이터를 불러오지 못하였습니다..");
						mv.setViewName("common/errorPage");
					}
				} catch (Exception e) {
					mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
				}
				return mv;
			}
		    
 // 공연장 수정
		    @PostMapping("/admin/hallmodify.do")
		    public ModelAndView ModifyHallInfo(ModelAndView mv
		    		, @ModelAttribute HallVO hall
					,@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile, HttpServletRequest request,
					int hallNo) {
				try {
//					if (reloadFile != null && !reloadFile.isEmpty()) {
//						String fileName = hall.getHallImgRename();
//						if (fileName != null) {
//							this.deletehallFile(request, fileName);
//						}
//						Map<String, Object> infoMap = this.savehallFile(reloadFile, request);
//						String hallFilename = (String) infoMap.get("fileName");
//						hall.setHallImgName(hallFilename);
//						hall.setHallImgRename((String) infoMap.get("fileRename"));
//						hall.setHallImgFilepath((String) infoMap.get("filePath"));
//						hall.setHallFileLength((long) infoMap.get("fileSize"));
//					}
//					int result = hService.updateHall(hall);
//					if (result > 0) {
//						mv.addObject("msg", "수정 성공하였습니다.")
//						.setViewName("redirect:/admin/hallDetail.do?hallNo=" + hall.getHallNo());
//					} else {
//						mv.addObject("msg", "데이터가 존재하지 않습니다.");
//						mv.setViewName("common/errorPage");
//					}
				} catch (Exception e) {
					mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
				}
				return mv;
			}
		    
// 공연장 삭제
		    @GetMapping("/admin/halldelete.do")
		    public ModelAndView deleteHall(ModelAndView mv, int hallNo) {
				try {
					int result = hService.deleteHall(hallNo);
					if (result > 0) {
						mv.addObject("msg", "삭제가 완료되었습니다.").setViewName("redirect:/admin/hallList.do");
					} else {
						mv.addObject("msg", "데이터가 존재하지 않습니다.").setViewName("common/errorPage");
					}
				} catch (Exception e) {
					mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
				}
				return mv;
			}
		    // 파일 저장
						private HallImgVO savehallFile(MultipartFile uploadFile, HttpServletRequest request) throws Exception {
							// 파일 이름
							String fileName = uploadFile.getOriginalFilename();
							// 저장 경로
							String projectPath 	 = request.getSession().getServletContext().getRealPath("resources");
							String saveDirectory = projectPath + "\\nuploadFiles";
							File sDir 			 = new File(saveDirectory);
							if (!sDir.exists()) {
								sDir.mkdir(); 
							}
							SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
							String strResult = sdf.format(new Date(System.currentTimeMillis())) + Math.random(); 
							String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
							String fileRename = strResult + "." + ext;
							String savePath 	 = saveDirectory + "\\" + fileRename;
							File file = new File(savePath);
							uploadFile.transferTo(file);
							long fileLength = uploadFile.getSize();
			//				Map<String, Object> infoMap = new HashMap<String, Object>();
			//				infoMap.put("fileName"	, fileName);
			//				infoMap.put("fileRename", fileRename);
			//				infoMap.put("filePath"	, savePath);
			//				infoMap.put("fileSize"	, fileLength);
							HallImgVO hImage = new HallImgVO();
							hImage.setHallImgName(fileName);
							hImage.setHallImgRename(fileRename);
							hImage.setHallImgFilepath(savePath);
							hImage.setHallFileLength(fileLength);
							return hImage;
						}

			// 파일 삭제
		    private void deletehallFile(HttpServletRequest request, String fileName) {
				String rPath = request.getSession().getServletContext().getRealPath("resources");
				String delFilePath = rPath + "\\nuploadFiles\\" + fileName;
				File delFile = new File(delFilePath);
				if (delFile.exists()) {
					delFile.delete();
				}
				
			}
		    
//공연장 상세
		    @PostMapping("/admin/hallDetail.do")
			public String showadmDetail() {
				return "admin/hallDetail";
			}
			@GetMapping("/admin/hallDetail.do")
			public ModelAndView showadmHallDetailForm(ModelAndView mv, int hallNo) {
				try {
					HallVO hall = hService.selectAdminHallByNo(hallNo);
					if (hall != null) {
						mv.addObject("hall", hall);
						mv.setViewName("admin/hallDetail");
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
	
}
