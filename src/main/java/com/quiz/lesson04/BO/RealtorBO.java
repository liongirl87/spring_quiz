package com.quiz.lesson04.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.DAO.RealtorMapper;
import com.quiz.lesson04.model.Realtor;

@Service
public class RealtorBO {

	@Autowired 
	private RealtorMapper realtorMapper;
	
	public void addRealtor(Realtor realtor) {
		realtorMapper.insertRealtor(realtor);
	}
	public Realtor getRealtorById(int id) {
		return realtorMapper.getRealtorById(id);
	}
}
