package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.BO.TestSellerBO;

@RequestMapping("/lesson04/test01")
@Controller
public class Lesson04Test01Controller {
	
	@Autowired
	private TestSellerBO testSellerBO;
	
	//http://localhost:8080/lesson04/test01/add_seller_view
	@GetMapping("/add_seller_view")
	public String addSellerView() {
		return "lesson04/testAddSeller";
	}
	
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname
			,@RequestParam("profileImageUrl") String profileImageUrl
			,@RequestParam("temperature") String temperature
			, Model mode) {
		
		
		return "lesson04/testAfterAddSeller";
	}
}
