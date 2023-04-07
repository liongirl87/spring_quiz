package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.BO.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	//http://localhost:8080/lesson04/quiz01/add_seller_view
	@RequestMapping("/add_seller_view")
	public String addSellerView() {
		return "lesson04/addSeller";	
	}
	
	@RequestMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam("image") String image,
			@RequestParam("temperature") Double temperature //double 소문자 더블은 NULL 불가능 Double은 NULL 가능
			) {
		
		// insert DB
		
		// 입력 성공 페이지 ->먼저 이것부터 체크 후 insert DB 진행
		sellerBO.addSeller(nickname,image,temperature);
		return "lesson04/afterAddSeller";
	}
	// http://localhost:8080/lesson04/quiz01/get_latest_seller_view
	// http://localhost:8080/lesson04/quiz01/get_latest_seller_view?id=2
	@GetMapping("/get_latest_seller_view")
	public String getLatestSellerView(
			@RequestParam(value="id", required=false) Integer id,
			Model model) {
		//DB SELECT
		Seller seller = null;	//Seller seller; <-이것도 null; 하지만 표기해주는게 좋다
		if (id == null) {
			// 최신 가입자를 가져온다
			seller = sellerBO.getLatestSeller();
		} else {
			// 아이디에 해당하는 사용자를 가져온다
			seller = sellerBO.getSellerById(id);
		}
		model.addAttribute("seller", seller); //맵이랑 사용법이 동일 키랑 벨류가 있어야 한다!! ""가 뷰에서 거내야하는거!
		return "lesson04/getLatestSellerView";
	}
	
	
	
	
	
}
