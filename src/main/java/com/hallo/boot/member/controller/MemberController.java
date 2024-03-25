package com.hallo.boot.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@PostMapping("/member/login.do")
	public String memberLogin(MemberVO mOne, HttpSession session, Model model) {
		try {
			MemberVO member = mService.checkMemberLogin(mOne);
			if (member != null) {
				session.setAttribute("memberId", member.getMemberId());
				session.setAttribute("memberName", member.getMemberName());
				return "redirect:/qna/list.do";
			} else {
				model.addAttribute("msg", "No Data Found");
				return "common/errorPage";
			}			
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/member/logout.do")
	public String memberLogout(HttpSession session, Model model) {
		session.invalidate();
		return "redirect:/";
	}
}
