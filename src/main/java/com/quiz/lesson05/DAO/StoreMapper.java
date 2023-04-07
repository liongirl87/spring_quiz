package com.quiz.lesson05.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.Review;
import com.quiz.lesson05.model.Store;

@Repository
public interface StoreMapper {

	public List<Store> selectStore();
	public List<Review> selectReview(@Param("id") int id);
}
