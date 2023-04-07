package com.quiz.lesson04.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.DAO.TestSellerMapper;

@Service
public class TestSellerBO {
	
	@Autowired
	private TestSellerMapper testSellerMapper;
	
	public void addSeller(String nickname, String profileImageUrl, String temperature) {
		testSellerMapper.insertSeller(nickname, profileImageUrl, temperature);
		
	}
}
