package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Lesson01Quiz02Controller {
	// @ResponseBody + return String => HttpMessageConverter(스프링프레임워크에 있는 클래스)  String => response에 글자로 담긴다. text/html
	// @ResponseBody + return 객체(list, map, 내가만든 클래스...) => HttpMessageConverter > jackson 라이브러리 동작시킴 =>JSON String 응답에 담긴다. application/json
	
	@RequestMapping("/1")
	public List<Map<String, Object>> quiz02_01() {
		List<Map<String, Object>> result = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		map.put("rate", 15);
		map.put("director", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		result.add(map);
		
		map = new HashMap<>();
		map.put("rate", 0);
		map.put("director", "로베르토 베니니");
		map.put("time", 116);
		map.put("title", "인생은 아름다워");
		result.add(map);

		map = new HashMap<>();
		map.put("rate", 12);
		map.put("director", "크리스토퍼 놀란");
		map.put("time", 147);
		map.put("title", "인셉션");
		result.add(map);

		map = new HashMap<>();
		map.put("rate", 19);
		map.put("director", "윤종빈");
		map.put("time", 133);
		map.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		result.add(map);

		map = new HashMap<>();
		map.put("rate", 15);
		map.put("director", "프란시스 로렌스");
		map.put("time", 137);
		map.put("title", "헝거게임");
		result.add(map);
		
		return result;
	}
	
	// http://localhost:8080/lesson01/quiz02/2
	@RequestMapping("/2")
	public List<Board> quiz02_2() {
		List<Board> list = new ArrayList<>();
		Board board = new Board();
		board.setTitle("안녕하세요 가입인사 드립니다");
		board.setUser("hagulu");
		board.setContent("안녕하세요 가입했어요, 앞으로 잘 부탁드립니다");
		list.add(board);
		
		Board board1 = new Board();
		board1.setTitle("헐 대박");
		board1.setUser("bada");
		board1.setContent("오늘 목요일이라니...금요일 인줄");
		list.add(board1);
		
		Board board2 = new Board();
		board2.setTitle("오늘 데이트한 이야기 해드릴게요");
		board2.setUser("banana");
		board2.setContent("....");
		list.add(board2);
		
		return list;
	}

	// http://localhost:8080/lesson01/quiz02/3
	@RequestMapping("/3")
	public ResponseEntity<List<Map<String, String>>> quiz02_3() {
		List<Map<String, String>> list = new ArrayList<>();
		Map<String, String> map = new HashMap<>();
		map.put("title", "안녕하세요 가입인사 드립니다");
		map.put("user", "hagulu");
		map.put("content", "안녕하세요 가입했어요, 앞으로 잘 부탁드립니다");
		list.add(map);
		
		return new ResponseEntity<>(list, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
