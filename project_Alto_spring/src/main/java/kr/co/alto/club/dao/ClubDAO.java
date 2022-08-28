package kr.co.alto.club.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.club.dto.ClubListDTO;

public interface ClubDAO {
	
	ClubDTO selectClubInfo(String club_code) throws DataAccessException;
	
	String selectNewClubCode() throws DataAccessException;
	void clubOpen(ClubDTO clubDTO) throws DataAccessException;
	
	List<ClubListDTO> selectBestClubList() throws DataAccessException;
	List<ClubListDTO> selectNewClubList() throws DataAccessException;
	List<ClubListDTO> selectPeoClubList() throws DataAccessException;
	List<HashMap<String, Object>> selectTopHobby() throws DataAccessException;
	List<ClubListDTO> selectTopHobbyList(String hobby_code) throws DataAccessException;
	
	List<ClubListDTO> selectHobClubList(String hobby_code) throws DataAccessException;	

}
