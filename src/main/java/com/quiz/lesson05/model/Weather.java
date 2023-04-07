package com.quiz.lesson05.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Weather {
	
	private int id;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date date;
	private String weather;
	private Double temperatures;
	private Double precipitation;
	private String microDust;
	private Double windSpeed;
	private Date createdAt;
	private Date updatedAt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public Double getTemperatures() {
		return temperatures;
	}
	public void setTemperatures(Double temperatures) {
		this.temperatures = temperatures;
	}
	public Double getPrecipitation() {
		return precipitation;
	}
	public void setPrecipitation(Double precipitation) {
		this.precipitation = precipitation;
	}
	public String getMicroDust() {
		return microDust;
	}
	public void setMicroDust(String microDust) {
		this.microDust = microDust;
	}
	public Double getWindSpeed() {
		return windSpeed;
	}
	public void setWindSpeed(Double windSpeed) {
		this.windSpeed = windSpeed;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
