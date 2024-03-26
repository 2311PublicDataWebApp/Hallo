package com.hallo.boot.qna.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.member.service.MemberService;
import com.hallo.boot.qna.service.QnaService;

@Controller
public class AdminController {
	
	@Autowired
	private MemberService mService;
	@Autowired 
	private QnaService qService;
	

	
	@GetMapping("/admin/logout.do")
	public String memberadminLogout(HttpSession session, Model model) {
		session.invalidate();
		return "redirect:/member/login.do";
	}
	
}
