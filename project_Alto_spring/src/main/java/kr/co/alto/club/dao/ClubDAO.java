package kr.co.alto.club.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.club.dto.ClubListDTO;

public interface ClubDAO {
	
	String selectNewClubCode() throws DataAccessException;
	void clubOpen(ClubDTO clubDTO) throws DataAccessException;
	
	List<ClubListDTO> selectBestClubList() throws DataAccessException;
	List<ClubListDTO> selectNewClubList() throws DataAccessException;

}
