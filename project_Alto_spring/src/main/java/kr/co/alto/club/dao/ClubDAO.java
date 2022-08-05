package kr.co.alto.club.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface ClubDAO {
	
	String selectNewClubCode() throws DataAccessException;
	void clubOpen(Map<String, Object> clubMap) throws DataAccessException;

}
