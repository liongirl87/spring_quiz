package com.quiz.lesson06;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.BO.BookingBO;
import com.quiz.lesson06.model.Booking;

@Controller
public class BookingController {

	@Autowired
	private BookingBO bookingBO;
	//http:/localhost:8080/booking/booking_list_view
	@GetMapping("/booking/booking_list_view")
	public String bookingListView(Model model) {
		List<Booking> booking = new ArrayList<>();
		booking = bookingBO.getBooking();
		model.addAttribute("booking", booking);
		
		return "booking/bookingListView";
	}
	
	@GetMapping("/booking/booking_view")
	public String bookingView() {
		return "booking/bookingView";
	}
	
	// 1. 예약 삭제 - AJAX의 호출
	@ResponseBody
	@DeleteMapping("/booking/del_booking")	
	public Map<String, Object> delBooking(
			@RequestParam("bookingId")int bookingId){
		Map<String, Object> result = new HashMap<>();
		int rowCount = bookingBO.delBooking(bookingId);
		if (rowCount > 0) {
			result.put("code", 1);
			result.put("resutl", "성공");
		} else {
			result.put("code", 500);
			result.put("resutl", "실패");
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/booking/add_booking")
	public Map<String, Object> addBooking(
			@RequestParam("name") String name
			,@RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date
			,@RequestParam("day") int day
			,@RequestParam("headcount") int headcount
			,@RequestParam("phoneNumber") String phoneNumber
			){
		// insert
		int rowCount = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		Map<String, Object> result = new HashMap<>();
		if(rowCount > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		return result;
	}
	
	@GetMapping("/booking/main_booking")
	public String mainBooking() {
		return "booking/bookingMain";
	}
	
	
	// 예약내역 조회 - AJAX 요청
	@ResponseBody
	@GetMapping("/booking/search_booking")
	public Map<String, Object> searchBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber,
			Model model){
		Map<String, Object> result = new HashMap<>();
		
		//select
		// 최신 예약내역 딱 한개만 가져온다 그래서 리스트말고 Booking으로
		Booking booking = bookingBO.getBookingByNamePhoneNumber(name, phoneNumber);
		if(booking != null) {
			result.put("code", 1);
			result.put("booking", booking); //booking을 통으로 내린다.
		} else {
			result.put("code", 500);
		}
		
		
		/*
		 * List<Booking> searchBooking = new ArrayList<>(); searchBooking =
		 * bookingBO.searchBooking(name, phoneNumber);
		 * model.addAttribute("searchBooking", searchBooking);
		 */
		
		
		return result;
	}
}
