package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.BO.WeatherBO;
import com.quiz.lesson05.model.Weather;

@Controller
public class WeatherHistoryController {
	
		@Autowired
		private WeatherBO weatherBO;
		
		// http:localhost:8080/weather/after_add_weather
		@RequestMapping("/weather/after_add_weather")
		public String afterAddWeather(
				Model model
				) {
			List<Weather> weathers = new ArrayList<>();
			
			weathers = weatherBO.getWeather(); //한단계 걸쳐서 넣으면 브레이크 포인트를 찍어서 디버깅을보기가 용이하다
			
			model.addAttribute("weathers", weathers);
			return "weather/afterAddWeather";
		}
		// http:localhost:8080/weather/add_weather_view
		@GetMapping("/weather/add_weather_view")
		public String addWeatherView() {
			return "weather/addWeather";
		}
		
		@PostMapping("/weather/add_weather")
		public String addWeather(
				@RequestParam("date") String date,
				@RequestParam("weather") String weather,
				@RequestParam("temperatures") Double temperatures,
				@RequestParam("precipitation") Double precipitation,
				@RequestParam("microDust")String microDust,
				@RequestParam("windSpeed")Double windSpeed
				) {
			//@RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,
			// insert
			weatherBO.addWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
			// select X
			// model X
			
			// redirect: 목록페이지로
			// "redircet:/weather/after_add_weather"
			return "redirect:/weather/after_add_weather";
		}
}
