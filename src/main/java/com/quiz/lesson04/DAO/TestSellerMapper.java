package com.quiz.lesson04.DAO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TestSellerMapper {

	public void insertSeller(
			@Param("nickname") String nickname,
			@Param("profileImageUrl") String profileImageUrl,
			@Param("temperature") String temperature);
}
