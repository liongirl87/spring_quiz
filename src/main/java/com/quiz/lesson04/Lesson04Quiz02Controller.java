package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.BO.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {

	@Autowired
	private RealtorBO realtorBO;
	
	//http://localhost:8080/lesson04/quiz02/add_realtor_view
	@GetMapping("/add_realtor_view")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) {
		// DB insert	//성공된 행의 갯수를 받고싶으면 int로 하고 필요없으면 void
		realtorBO.addRealtor(realtor);
		
		
		// DB select	- 지금 가입한사람(마이바티스가 id를 가져올수있다)
		Realtor latestRealtor = realtorBO.getRealtorById(realtor.getId());
		
		// Model에 데이터를 담는다(view에서 뿌려주기위해선)
		model.addAttribute("result", latestRealtor);
				
		// view 이동 >추가된 공인중개사의 정보를 보여주는 jsp
		return "lesson04/afterAddRealtor";
	}

}
