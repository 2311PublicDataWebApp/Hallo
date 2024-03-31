package com.hallo.boot.booking.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hallo.boot.booking.domain.vo.BookingVO;
import com.hallo.boot.booking.service.BookingService;
import com.hallo.boot.common.Pagination;
import com.hallo.boot.hall.domain.vo.HallVO;
import com.hallo.boot.hall.service.HallService;
import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.member.service.MemberService;

@Controller
public class BookingController {

	@Autowired
	private BookingService bService;
	@Autowired
	private MemberService mService;
	@Autowired
	private HallService hService;
	
	@GetMapping("/booking/list.do")
	public String showBookingList(Model model
			, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
			int boardLimit = 10;
			int totalCount = bService.getTotalCount1();
			Pagination pi = new Pagination(currentPage, totalCount, boardLimit);
			List<BookingVO> bList = bService.selectBookingList(pi);
			if (bList != null) {
				model.addAttribute("bList", bList);
				model.addAttribute("pi", pi);
				return "booking/list";
			} else {
				model.addAttribute("msg", "No Data Found");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@GetMapping("/booking/insert.do")
	public String showInsertBooking(Model model, Integer hallNo) {
		try {
			List<BookingVO> bList = bService.selectBookingList(hallNo);
			if (bList != null) {
				model.addAttribute("bList", bList);
				model.addAttribute("hallNo", hallNo);
				return "booking/insert";
			} else {
				model.addAttribute("msg", "No Data Found");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@GetMapping("/booking/insert/ajax.do")
	public String updateCalendarDate() {
		return "";
	}
	
	@PostMapping("/booking/insert.do")
	public String insertBooking(Model model, BookingVO booking) {
		try {
			booking.setBookingStartTime(stringToTimestamp(booking.getStartTime()));
			booking.setBookingEndTime(stringToTimestamp(booking.getEndTime()));
			BookingVO bOne = bService.insertBooking(booking);
			if (bOne != null) {
				bOne.setTotalTime(bService.getTotalTime(bOne.getBookingNo()));
				MemberVO member = mService.getOneById(booking.getMemberId());
				HallVO hall = hService.selectOneByNo(booking.getHallNo());
				model.addAttribute("booking", bOne);
				model.addAttribute("member", member);
				model.addAttribute("hall", hall);
				return "payment/insert";
			} else {
				model.addAttribute("msg", "예약 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	private Timestamp stringToTimestamp(String date) throws ParseException {
		date = date.replace('T', ' ');
		date = date.replace('-', '/');
		date = date.substring(0, date.indexOf("+"));
		// String to Timestamp
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		dateFormat.setLenient(false);// 날짜와 시간을 엄격하게 확인
		Date stringToDate = dateFormat.parse(date);
		Timestamp stringToTimestamp = new Timestamp(stringToDate.getTime());
		return stringToTimestamp;
	}
}
