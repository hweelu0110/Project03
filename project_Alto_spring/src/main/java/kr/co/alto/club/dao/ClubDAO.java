package kr.co.alto.club.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.club.dto.ClubDTO;

public interface ClubDAO {
	
	String selectNewClubCode() throws DataAccessException;
	void clubOpen(ClubDTO clubDTO) throws DataAccessException;

}
