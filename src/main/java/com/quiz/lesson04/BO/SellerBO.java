package com.quiz.lesson04.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.DAO.SellerMapper;
import com.quiz.lesson04.model.Seller;

@Service
public class SellerBO {
	@Autowired
	private SellerMapper sellerMapper;
	
	public void addSeller(String nickname,String image,double temperature) {
		sellerMapper.addSeller(nickname, image, temperature);
	}
	public Seller getLatestSeller() {
		return sellerMapper.selectLatestSeller();
	}
	public Seller getSellerById(int id) {
		return sellerMapper.selectSellerById(id);
	}
}
