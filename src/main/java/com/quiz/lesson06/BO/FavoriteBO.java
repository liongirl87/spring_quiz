package com.quiz.lesson06.BO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.DAO.FavoriteMapper;
import com.quiz.lesson06.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteMapper favoriteMapper;
	
	// input: name, url	output:성공된 행의 개수
	public int addFavorite(String name, String url) {
		return favoriteMapper.insertFavorite(name, url);
	}
	public List<Favorite> getFavorite(){
		return favoriteMapper.selectFavorite();
	}

	public boolean existFavoriteByUrl(String url) {
		return favoriteMapper.existFavoriteByUrl(url);
		// input: url	output:1개행 또는 0개행 Favorite
		
	}
	
	public Favorite getFavoriteByUrl(String url) {
		return favoriteMapper.selectFavoriteByUrl(url);
	}
	
	public boolean deleteFavoriteById(int favoriteId) {
		return favoriteMapper.deleteFavoriteById(favoriteId);
	}
	
}
