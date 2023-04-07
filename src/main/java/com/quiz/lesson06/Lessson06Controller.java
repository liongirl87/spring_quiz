package com.quiz.lesson06;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.BO.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lessson06Controller {
	@Autowired
	private FavoriteBO favoriteBO;
	
	@GetMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/addFavorite";
	}
	
	// AJAX를 통한 요청 -무조건 @ResponseBody를 붙인다
	@PostMapping("/add_favorite")
	@ResponseBody
	public Map<String, Object> addFavorite(
			
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		// "{"code":1, "result":"성공"}"
		// "{"code":500, "errorMessage":"추가하는데 실패했습니다."}"
		
		// insert 
		int rowCount = favoriteBO.addFavorite(name, url);
		
		Map<String, Object> result = new HashMap<>();
		if (rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "데이터를 추가하는데 실패했습니다.");
		}
		
		
		favoriteBO.addFavorite(name, url);
		return result;	// JSON String
		
	}
	@GetMapping("/result_view")
	public String resultView(Model model) {
		List<Favorite> favorite = new ArrayList<>();
		favorite = favoriteBO.getFavorite();
		model.addAttribute("favorite", favorite);
		
		return "lesson06/result";
	}
	
	//AJAX의 요청
	@ResponseBody
	@GetMapping("/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url) {
		Map<String, Boolean> result = new HashMap<>();
		result.put("isDuplication", favoriteBO.existFavoriteByUrl(url));
		return result;
	}
	// AJAX의 요청
	// id로 삭제 API	<-del_favorite?id=13 <-id로 삭제가능하기떄문에 post로 사용하자!!!
	@ResponseBody
	@GetMapping("/del_favorite")
	public Map<String, Boolean> delFavorite(
			@RequestParam("favoriteId") int favoriteId) {
		Map<String, Boolean> result = new HashMap<>();
		result.put("delFavorite", favoriteBO.deleteFavoriteById(favoriteId));
		return result;
	}
}
