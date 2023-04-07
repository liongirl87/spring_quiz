package com.quiz.lesson05.BO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.DAO.WeatherMapper;
import com.quiz.lesson05.model.Weather;

@Service
public class WeatherBO {
	@Autowired
	private WeatherMapper weatherMapper;
	
	public List<Weather> getWeather() {
		return weatherMapper.selectWeather();
	}
	
	public void addWeather(String date, String weather, Double temperatures, Double precipitation
							,String microDust, Double windSpeed) {
		weatherMapper.insertWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
	}

}