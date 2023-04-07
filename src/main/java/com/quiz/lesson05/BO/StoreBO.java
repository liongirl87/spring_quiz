package com.quiz.lesson05.BO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.DAO.StoreMapper;
import com.quiz.lesson05.model.Review;
import com.quiz.lesson05.model.Store;

@Service
public class StoreBO {
	@Autowired
	private StoreMapper storeMapper;
	
	public List<Store> getStore() {
		return storeMapper.selectStore();
	}
	public List<Review> getReview(int id) {
		return storeMapper.selectReview(id);
	}
}
