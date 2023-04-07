package com.quiz.lesson06.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Favorite;

@Repository
public interface FavoriteMapper {
	
	public int insertFavorite(
			@Param("name") String name,
			@Param("url") String url);
	
	public List<Favorite> selectFavorite();
	
	public boolean existFavoriteByUrl(
			@Param("url") String url);
	
	public Favorite selectFavoriteByUrl(String url);
	
	public boolean deleteFavoriteById(
			int favoriteId);
}
