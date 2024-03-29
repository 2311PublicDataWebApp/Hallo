package com.hallo.boot.admin.controller;

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

import com.hallo.boot.map.domain.vo.MapVO;
import com.hallo.boot.map.service.MapService;
import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.member.service.MemberService;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;
import com.hallo.boot.notice.domain.vo.NoticeVO;
import com.hallo.boot.notice.service.NoticeService;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;
import com.hallo.boot.qna.domain.vo.QnaVO;
import com.hallo.boot.qna.service.QnaService;

@Controller
public class AdController {
		
		@Autowired
		private NoticeService nService;
		
		@Autowired
		private MapService mapService;
		
		@Autowired
		private MemberService mService;
		
		@Autowired
		private QnaService qService;
		
		// 공지 입력 페이지 이동
		@GetMapping("/admin/notiregister.do")
		public String showWriteForm() {
			return "ad_notice/write";
		}
		
		// 공지 입력
		@PostMapping("/admin/notiregister.do")
		public ModelAndView insertNotice(ModelAndView mv
				, @ModelAttribute NoticeVO notice
				, HttpSession session
				, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
				, HttpServletRequest request) {
			try {
				String noticeWriter = (String)session.getAttribute("memberName");
				notice.setNoticeWriter(noticeWriter);
				if (uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					Map<String, Object> infoMap = this.saveFile(uploadFile, request);
					String fileName 	= (String) infoMap.get("fileName");
					String fileRename 	= (String) infoMap.get("fileRename");
					String filePath 	= (String) infoMap.get("filePath");
					long fileLength 	= (long) infoMap.get("fileSize");
					
					notice.setNoticeFileName(fileName);
					notice.setNoticeFileRename(fileRename);
					notice.setNoticeFilePath(filePath);
					notice.setNoticeFileLength(fileLength);
				}
				int result = nService.insertNotice(notice);
				if (result > 0) {
					mv.setViewName("redirect:/admin/notilist.do");
				} else {
					mv.addObject("msg", "공지사항 등록이 완료되지 못했습니다.");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
		
		
		@GetMapping("/admin.do")
	    public ModelAndView showAdminPage(ModelAndView mv,
	            @RequestParam(value="page", 
	            required=false, defaultValue="1") Integer currentPage) {
			try {
				int totalCount = nService.getTotalCount();
				NoticePageInfo pi = this.get5PageInfo(currentPage, totalCount);
				List<NoticeVO> nList = nService.selectNoticeList(pi);
				List<MapVO> mapList = mapService.selectHallList(pi);
				List<QnaVO> qList = qService.selectDBQnaList(pi);
				List<MemberVO> mList = mService.selectDBMemberList(pi);
				mv.addObject("qList", qList);
				mv.addObject("mList", mList);
				mv.addObject("nList", nList);
				mv.addObject("mapList", mapList);
				mv.addObject("pi", pi);
				mv.setViewName("ad/dashboard");
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			return mv;
	    };
	    
	    @GetMapping("/admin/notilist.do")
	    public ModelAndView adminNoticeList(ModelAndView mv,
	            @RequestParam(value="page", 
	            required=false, defaultValue="1") Integer currentPage) {
			try {
				int totalCount = nService.getTotalCount();
				NoticePageInfo pi = this.getPageInfo(currentPage, totalCount);
				List<NoticeVO> nList = nService.selectNoticeList(pi);
				mv.addObject("nList", nList);
				mv.addObject("pi", pi);
				mv.setViewName("ad_notice/list");
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			return mv;
	    };
	    
	    @GetMapping(value="/admin/notisearch.do")
	 	public ModelAndView adminNoticeSearch(ModelAndView mv
	 			, @RequestParam("searchCondition") String searchCondition
	 			, @RequestParam("searchKeyword") String searchKeyword
	 			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
	 		
	 		Map<String, String> paramMap = new HashMap<String, String>();
	 		paramMap.put("searchCondition", searchCondition);
	 		paramMap.put("searchKeyword", searchKeyword);
	 		int totalCount = nService.getTotalCount(paramMap);
	 		NoticePageInfo pi = this.getPageInfo(currentPage, totalCount);
	 		List<NoticeVO> searchList = nService.searchNoticesByKeyword(pi, paramMap);
	 		mv.addObject("sList", searchList);
	 		mv.addObject("pi", pi);
	 		mv.addObject("searchCondition", searchCondition);
	 		mv.addObject("searchKeyword", searchKeyword);
	 		mv.setViewName("ad_notice/search");
	 		return mv;
	 	}
	    
		// 공지 상세조회
	    @GetMapping("/admin/notidetail.do")
	    public ModelAndView adminNoticeDetail(ModelAndView mv, int noticeNo) {
			try {
				NoticeVO notice = nService.selectByNoticeNo(noticeNo);
				if (notice != null) {
					mv.addObject("notice", notice).setViewName("ad_notice/detail");
				} else {
					mv.addObject("msg", "데이터 불러오기가 완료되지 못했습니다.");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
			}
			return mv;
	    }
	    
	 // 공지 수정 페이지 이동
	    @GetMapping("/admin/notimodify.do")
	    public ModelAndView adminModifyPage(ModelAndView mv, int noticeNo) {
			try {
				NoticeVO notice = nService.selectByNoticeNo(noticeNo);
				if (notice != null) {
					mv.addObject("notice", notice);
					mv.setViewName("ad_notice/modify");
				} else {
					mv.addObject("msg", "데이터 불러오기가 완료되지 못했습니다.");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
			}
			return mv;
		}
	    
	    // 공지 수정
	    @PostMapping("/admin/notimodify.do")
	    public ModelAndView updateNotice(ModelAndView mv, @ModelAttribute NoticeVO notice,
				@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile, HttpServletRequest request,
				int noticeNo) {
			try {
				if (reloadFile != null && !reloadFile.isEmpty()) {
					String fileName = notice.getNoticeFileRename();
					if (fileName != null) {
						// 있으면 파일 삭제
						this.deleteFile(request, fileName);
					}
					// 없으면 새로 업로드하려는 파일 저장
					Map<String, Object> infoMap = this.saveFile(reloadFile, request);
					String noticeFilename = (String) infoMap.get("fileName");
					notice.setNoticeFileName(noticeFilename);
					notice.setNoticeFileRename((String) infoMap.get("fileRename"));
					notice.setNoticeFilePath((String) infoMap.get("filePath"));
					notice.setNoticeFileLength((long) infoMap.get("fileSize"));
				}
				int result = nService.updateNotice(notice);
				if (result > 0) {
					mv.setViewName("redirect:/admin/notidetail.do?noticeNo=" + notice.getNoticeNo());
				} else {
					mv.addObject("msg", "데이터가 존재하지 않습니다.");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
			}
			return mv;
		}
	    
	 // 공지 삭제
	    @GetMapping("/admin/notidelete.do")
	    public ModelAndView deleteNotice(ModelAndView mv, int noticeNo) {
			try {
				int result = nService.deleteNotice(noticeNo);
				if (result > 0) {
					mv.setViewName("redirect:/admin/notilist.do");
				} else {
					mv.addObject("msg", "데이터가 존재하지 않습니다.").setViewName("common/errorPage");
				}
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
			}
			return mv;
		}
	    
	    // 5 페이징
	    private NoticePageInfo get5PageInfo(Integer currentPage, int totalCount) {
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
	    
	 // 10 페이징
	    private NoticePageInfo getPageInfo(Integer currentPage, int totalCount) {
			NoticePageInfo pi = null;
			int boardLimit = 10; // 한 페이지당 보여줄 게시물의 갯수
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
	    
	    // 파일 저장
	    private Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws Exception {
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
			String strResult = sdf.format(new Date(System.currentTimeMillis())); 
			String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
			String fileRename = strResult + "." + ext;

			
			String savePath 	 = saveDirectory + "\\" + fileRename;
			File file = new File(savePath);
			
			uploadFile.transferTo(file);
			
			long fileLength = uploadFile.getSize();
			Map<String, Object> infoMap = new HashMap<String, Object>();
			infoMap.put("fileName"	, fileName);
			infoMap.put("fileRename", fileRename);
			infoMap.put("filePath"	, savePath);
			infoMap.put("fileSize"	, fileLength);
			return infoMap;
		}
	    
	    // 파일 삭제
	    private void deleteFile(HttpServletRequest request, String fileName) {
			// TODO Auto-generated method stub
			String rPath = request.getSession().getServletContext().getRealPath("resources");
			String delFilePath = rPath + "\\nuploadFiles\\" + fileName;
			File delFile = new File(delFilePath);
			if (delFile.exists()) {
				delFile.delete();
			}
			
		}

}
