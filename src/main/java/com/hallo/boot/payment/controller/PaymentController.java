package com.hallo.boot.payment.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hallo.boot.hall.service.HallService;
import com.hallo.boot.member.service.MemberService;
import com.hallo.boot.payment.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private HallService hService;
	@Autowired
	private PaymentService pService;

	@PostMapping("/payment/insert.do")
	public String showPaymentInsert(Model model) {
		try {
			return "common/errorPage";
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@PostMapping("/payment/insert/ajax.do")
	public String paymentAjax(Map<String, Object> rsp) {
		System.out.println(rsp);
		return "Good";
	}
	
	@GetMapping("/payment/success.do")
	public String showPaymentSuccess() {
		return "payment/paymentSuccess";
	}
	
	@GetMapping("/payment/fail.do")
	public String showPaymentFail() {
		return "payment/paymentFail";
	}
}
