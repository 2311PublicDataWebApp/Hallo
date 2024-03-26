package com.hallo.boot.booking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hallo.boot.booking.service.BookingService;

@Controller
public class BookingController {

	@Autowired
	private BookingService bService;
	
	@GetMapping("/booking/insert.do")
	public String showInsertBooking() {
		return "booking/insert";
	}
}
