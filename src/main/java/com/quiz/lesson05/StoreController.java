package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.BO.StoreBO;
import com.quiz.lesson05.model.Review;
import com.quiz.lesson05.model.Store;

@Controller
public class StoreController {

	@Autowired
	private StoreBO storeBO;
	// http://localhost:8080/lesson05/store_view
	@RequestMapping("/lesson05/store_view")
	public String storeView(Model model) {
		List<Store> store = new ArrayList<>();

		store = storeBO.getStore();
		model.addAttribute("store", store);
		
		return "store/storeView";
	}
	
	@RequestMapping("/lesson05/view_review")
	public String viewReview(@RequestParam("id") int id, Model model) {
		List<Review> review = new ArrayList<>();
		
		review = storeBO.getReview(id);
		model.addAttribute("review", review);
		
		return "store/reviewView";
	}
	
}
