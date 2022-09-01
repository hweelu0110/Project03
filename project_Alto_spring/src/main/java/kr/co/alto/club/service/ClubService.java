package kr.co.alto.club.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.club.dto.ClubDTO;

public interface ClubService {
	
	public ClubDTO selectClubInfo(String club_code) throws DataAccessException;

	public Map<String, Object> clubMainList(String mem_id) throws DataAccessException;
	public Map<String, Object> clubSearchList(String mem_id) throws DataAccessException;
	public void clubOpen(ClubDTO clubDTO) throws DataAccessException;
	public Map<String, Object> selectHobClubList(String hobby_code) throws DataAccessException;
	
}
