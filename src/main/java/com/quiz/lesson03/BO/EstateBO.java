package com.quiz.lesson03.BO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.DAO.EstateMapper;
import com.quiz.lesson03.model.Estate;
import com.quiz.lesson03.model.RealEstate;

@Service
public class EstateBO {
	
	@Autowired
	private EstateMapper estateMapper;
	
	public Estate getEstate(int idt) {
		return estateMapper.selectEstate(idt);
	}
	
	// input:price	output:List<Estate>
	// 
	public List<Estate> getEstatePrice(int price) {
		List<Estate> estateList = estateMapper.selectEstatePrice(price);
		return estateList;
	}

	// getRealEstateListByAreaPrice <-메소드명
	public List<Estate> getEstateAP(int area, int price) {
		List<Estate> estateAPList =estateMapper.selectEstateAP(area, price);
		return estateAPList;
	}
	
	public int addRealEstate(RealEstate realEstate) {
		return estateMapper.insertEstate(realEstate);
	}
	
	public int addRealEstateAsField(int realtorID, String adress, int area
			,String type, int price, int rentPrice) {
		return estateMapper.insertEstateAsField(realtorID,adress,area,type,price,rentPrice);
	}
	
	public int updateEstateById(int id,int price) {
		return estateMapper.insertEstateById(id, price);
	}
	
	public int deleteEstateById(int id) {
		return estateMapper.deleteEstateById(id);
	}
	
}
