package com.quiz.lesson04.DAO;

import org.springframework.stereotype.Repository;

import com.quiz.lesson04.model.Realtor;

@Repository
public interface RealtorMapper {

	public void insertRealtor (Realtor realtor);
	
	public Realtor getRealtorById(int id);
}
