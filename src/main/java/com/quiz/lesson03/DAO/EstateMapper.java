package com.quiz.lesson03.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.Estate;
import com.quiz.lesson03.model.RealEstate;

@Repository
public interface EstateMapper {

	public Estate selectEstate(int id3);
	
	public List<Estate> selectEstatePrice(@Param("price") int price);
	
	
	// 마이베티스는 파리미터를 단 한개만 보낼 수 잇다.
	// 파라미터가 2개 이상일 때는 하나의 맵으로 만들어서 보내야 한다.
	// @Param 을 사용하면 하나의 맵으로 만들어준다.
	public List<Estate> selectEstateAP(	// 두개이상의 파라미터를 보낼때는 @Param을 써야한다
			@Param("area") int area,
			@Param("price") int price);

	public int insertEstateAsField(
			@Param("realtorId") int realtorID,
			@Param("address") String address,
			@Param("area") int area,
			@Param("type") String type,
			@Param("price") int price,
			@Param("rentPrice") int rentPrice);

	public int insertEstate(RealEstate realEstate);
	
	public int insertEstateById(
			@Param("id") int id,
			@Param("price") int price);
	
	public int deleteEstateById(int id);
	
	

}
