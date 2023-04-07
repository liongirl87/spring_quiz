package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.BO.EstateBO;
import com.quiz.lesson03.model.RealEstate;

@RequestMapping("/lesson03/quiz02")
@RestController
public class Lesson03Quiz02RestController {

	@Autowired
	private EstateBO estateBo;
	
	
	// http://localhost:8080/lesson03/quiz02/01
	@RequestMapping("/01")
	public String quiz02() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int countRow = estateBo.addRealEstate(realEstate);

		return "입력성공:" + countRow;
	};
	@RequestMapping("/2")
	//http://localhost:8080/lesson03/quiz02/02?realtorid=5
	public String quiz03(@RequestParam("realtorid") int realtorid) {
		int countRow = estateBo.addRealEstateAsField(
				realtorid
				,"썅떼빌리버 오피스텔 814호"
				,45
				,"월세"
				,100000
				,120);
		return "입력성공:" + countRow;
		
	}
	@RequestMapping("/3")
	//http://localhost:8080/lesson03/quiz02/3?id=5&price=70000
	public String quiz03_01(
			@RequestParam("id") int id,
			@RequestParam("price")int price) {
		int countRow = estateBo.updateEstateById(id,price);
		return "수정성공" + countRow;
		
	}
	// http://localhost:8080/lesson03/quiz02/4?id=21
	@RequestMapping("/4")
	public String quiz04_01(@RequestParam("id") int id) {
		int countRow =estateBo.deleteEstateById(id);
		
		return "삭제성공" + countRow;
	}
	

}
