package com.quiz.lesson05.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.Weather;

@Repository
public interface WeatherMapper {

	public List<Weather> selectWeather();
	
	public void insertWeather(
			@Param("date") String date,
			@Param("weather") String weather,
			@Param("temperatures") Double temperatures,
			@Param("precipitation") Double precipitation,
			@Param("microDust") String microDust,
			@Param("windSpeed") Double windSpeed);
}