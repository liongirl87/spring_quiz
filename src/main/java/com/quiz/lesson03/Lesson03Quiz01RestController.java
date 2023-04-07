package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.BO.EstateBO;
import com.quiz.lesson03.model.Estate;

@RequestMapping("/lesson03/quiz01")
@RestController
public class Lesson03Quiz01RestController {
	
	@Autowired
	private EstateBO estateBO;
	
	// http://localhost:8080/lesson03/quiz01/1?id=5
	@RequestMapping("/1")
	public Estate quiz01_1(@RequestParam("id2") int id1) {
		return estateBO.getEstate(id1);
	}
	
	// http://localhost:8080/lesson03/quiz01/2?price=50
	@RequestMapping("/2")
	public List<Estate> quiz01_2(@RequestParam("price") int price) {
		List<Estate> estateList = estateBO.getEstatePrice(price);
		return estateList;
		
		// return estateBO.getRealEstateListByRentPrice(price)
	}
	
	//http://localhost:8080/lesson03/quiz01/3?area=50&price=30
	@RequestMapping("/3")
	public List<Estate> quiz01_3(
			@RequestParam("area") int area, @RequestParam("price") int price) {
		List<Estate> estateAPList = estateBO.getEstateAP(area, price);
		return estateAPList;
	}

}
