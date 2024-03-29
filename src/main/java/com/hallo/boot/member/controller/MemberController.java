package com.hallo.boot.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@GetMapping("/member/login.do")
	public String showLoginForm() {
		return "member/login";
	}
	
	// 로그인
	@PostMapping("/member/login.do")
	public String memberLogin(MemberVO mOne, HttpSession session, Model model) {
		try {
			MemberVO member = mService.checkMemberLogin(mOne);
			if (member != null) {
				session.setAttribute("memberId", member.getMemberId());
				session.setAttribute("memberName", member.getMemberName());
				return "redirect:/";
			} else {
				model.addAttribute("msg", "No Data Found");
				return "common/errorPage";
			}			
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 로그아웃
	@GetMapping("/member/logout.do")
	public String memberLogout(HttpSession session, Model model) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입
	@GetMapping("/member/register.do")
	public String showMemberInsert(Model model) {
		return "/member/insert";
	}
	@PostMapping("/member/register.do")
	public String memberInsert(@ModelAttribute MemberVO member, Model model) {
		try {
			int result = mService.memberInsert(member);
			if(result > 0) {
				// 로그인 페이지
				return "redirect:/";
			}else {
				// 실패 에러페이지
				model.addAttribute("msg", "Service Failed");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// 예외발생시 에러페이지
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 마이페이지
	@GetMapping("/member/mypage.do")
	public String MyPage(HttpSession session, Model model) {
		try {
			String memberId = (String)session.getAttribute("memberId");
			MemberVO member = null;
			if(memberId != null) {
				member = mService.getOneById(memberId);
			}
			if(memberId != null) {
				model.addAttribute("member", member);
				return "member/mypage";
			}else {
				model.addAttribute("msg","회원정보 조회를 실패했습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 회원정보 수정
	@GetMapping("/member/update.do")
	public String showMemberUpdate(HttpSession session, Model model) {
		try {
			String memberId = (String)session.getAttribute("memberId");
			MemberVO member = null;
			if(memberId != null) {
				member = mService.getOneById(memberId);
			}
			if(member != null) {
				model.addAttribute("member", member);
				return "/member/modify";
			}else {
				model.addAttribute("msg", "회원 정보 조회를 완료하지 못하였습니다.");
				return "common/errorPage";
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	// 예약목록
	@GetMapping("/member/reserve.do")
	public String memberReserve() {
		return "member/reserve";
	}
	
	@PostMapping("/member/update.do")
	public String memberModify(@ModelAttribute MemberVO member, Model model) {
		try {
			int result = mService.memberUpdate(member);
			if(result > 0) {
				model.addAttribute("member", member);
				return "member/mypage";
			}else {
				model.addAttribute("msg", "회원 정보 수정을 실패하였습니다");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 회원탈퇴
	@GetMapping("/member/delete.do")
	public String memberDelete(String memberId, HttpSession session, Model model) {
		try {
			String sessionId = (String)session.getAttribute("memberId");
			int result = 0;
			if(sessionId != null && sessionId.equals(memberId)) {
				result = mService.memberDelete(memberId);
			}else {
				model.addAttribute("msg", "로그인을 해야 합니다.");
				return "common/errorPage";
			}
			// 탈퇴 성공했는지 확인
			if(result > 0) {
				return "member/login";
			}else {
				model.addAttribute("msg", "회원탈퇴가 완료되지 않았습니다");
				return "common/errorPage";
			}
			
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
}

















