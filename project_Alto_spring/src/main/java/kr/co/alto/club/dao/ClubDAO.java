package kr.co.alto.club.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.club.dto.ClubListDTO;
import kr.co.alto.club.dto.JoinDTO;

public interface ClubDAO {
	
	public List<ClubListDTO> selectBestClubList() throws DataAccessException;
	public List<ClubListDTO> selectNewClubList() throws DataAccessException;
	public List<ClubListDTO> selectPeoClubList() throws DataAccessException;
	public List<HashMap<String, Object>> selectTopHobby() throws DataAccessException;
	public List<ClubListDTO> selectTopHobbyList(String hobby_code) throws DataAccessException;
	
	public List<ClubListDTO> selectHobClubList(String hobby_code) throws DataAccessException;	
	public List<ClubListDTO> selectSearchClubList(Map<String, Object> searchMap) throws DataAccessException;
	
	public ClubDTO selectClubInfo(String club_code) throws DataAccessException;
	
	public String selectNewClubCode() throws DataAccessException;
	public void clubOpen(ClubDTO clubDTO) throws DataAccessException;
	public void clubManagerJoin(Map<String, Object> joinMap) throws DataAccessException;

	public String selectNewJoinCode() throws DataAccessException;
	public void clubJoin(Map<String, Object> joinMap) throws DataAccessException;
	

	public List<JoinDTO> selectClubMemberList(String club_code) throws DataAccessException;

	public void clubOut(Map<String, Object> joinMap) throws DataAccessException;

	public void addClubMemberNum(String club_code) throws DataAccessException;

	public void minClubMemberNum(String club_code) throws DataAccessException;

	public void addOutCount(String club_code) throws DataAccessException;

	public String chkManager(Map<String, Object> joinMap) throws DataAccessException;

	public String nextManager(String club_code) throws DataAccessException;

	public void changeManagerJoin(Map<String, Object> joinMap) throws DataAccessException;
	public void changeManagerClub(Map<String, Object> joinMap) throws DataAccessException;

	public void deleteClub(String club_code) throws DataAccessException;

	public String selectClubHobbyCode(String club_code) throws DataAccessException;
	
	public void clubUpdate(Map<String, Object> clubInfoMap) throws DataAccessException;
	
	public String chkClubLikeYN(Map<String, Object> likeChk) throws DataAccessException;

	public List<ClubDTO> keywordClub(String keyword) throws DataAccessException;
	
	public List<ClubListDTO> aloneClubList() throws DataAccessException;
	
}
