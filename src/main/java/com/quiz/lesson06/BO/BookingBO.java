package com.quiz.lesson06.BO;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.DAO.BookingMapper;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingMapper bookingMapper;
	
	public List<Booking> getBooking(){
		return bookingMapper.selectBooking();
	}
	
	public int delBooking(int bookingId) {
		return bookingMapper.delBooking(bookingId);
	}
	public int addBooking(String name, Date date, int day, int headcount, String phoneNumber) {
		return bookingMapper.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	
	// input:name,phoneNumber output:Booking
  
	public Booking getBookingByNamePhoneNumber(String name, String phoneNumber) {
		List<Booking> bookingList = bookingMapper.selectBookingByNamePhoneNumber(name, phoneNumber);
		
		// [1  3  7]
		// []
		// [7]
		// 리스트로 받아오면 NULL일수없다.
		
		if(bookingList.isEmpty()) { // 비어있는경우 체크하는 함수 isEmpty()
			return null;
		}
		
		// 비어있지 않으면 값이 있고, 마지막 인덱스에 있는 값을 돌려준다.(최신값)
		return bookingList.get(bookingList.size() - 1);
		
	}
	
	public List<Booking> searchBooking(String name, String phoneNumber){
		return bookingMapper.searchBooking(name, phoneNumber);
	}
}
