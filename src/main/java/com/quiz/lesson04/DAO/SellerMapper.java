package com.quiz.lesson04.DAO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson04.model.Seller;

@Repository
public interface SellerMapper {

	public void addSeller(
			@Param("nickname")String nickname,
			@Param("image")String image,
			@Param("temperature")double temperature);
	public Seller selectLatestSeller();
	public Seller selectSellerById(@Param("id") int id);
}
