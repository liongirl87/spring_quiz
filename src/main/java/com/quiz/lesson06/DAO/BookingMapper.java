package com.quiz.lesson06.DAO;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingMapper {

	public List<Booking> selectBooking();
	
	public int delBooking(int bookingId);
	
	public int insertBooking(
			@Param("name") String name,
			@Param("date") Date date,
			@Param("day") int day,
			@Param("headcount") int headcount,
			@Param("phoneNumber") String phoneNumber);
	
	public List<Booking> searchBooking(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);

	// DB에서는 여러개가 나왔는데 Booking은 하나만 받을 수 있으니깐 오류가 난다 따라서 List로 받아야 한다
	public List<Booking> selectBookingByNamePhoneNumber(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
}
