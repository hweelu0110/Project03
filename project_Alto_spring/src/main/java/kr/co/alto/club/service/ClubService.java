package kr.co.alto.club.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.club.dto.ClubListDTO;

public interface ClubService {
	
	public Map<String, Object> clubMainList(String mem_id) throws DataAccessException;
	public Map<String, Object> clubSearchList(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<HashMap<String, Object>> selectTopHobby() throws DataAccessException;
	public List<ClubListDTO> selectBestClubList() throws DataAccessException;
	public List<ClubListDTO> selectNewClubList() throws DataAccessException;
	
	public Map<String, Object> selectHobClubList(String hobby_code) throws DataAccessException;

	public Map<String, Object> selectClubInfo(String club_code) throws DataAccessException;
	
	public String clubOpen(ClubDTO clubDTO) throws DataAccessException;
	
	public void clubInfoEdit(Map<String, Object> clubInfoMap) throws DataAccessException;
	
	public void clubJoin(Map<String, Object> joinMap) throws DataAccessException;
	
	public void clubOut(Map<String, Object> joinMap) throws DataAccessException;
	
	public String selectClubHobbyCode(String club_code) throws DataAccessException;
	
	public String chkClubLikeYN(Map<String, Object> likeChk) throws DataAccessException;
	
	
	public List<ClubDTO> keywordClub(String keyword) throws Exception;
	
	
	public List<ClubListDTO> aloneClubList() throws DataAccessException;
	
	
}
