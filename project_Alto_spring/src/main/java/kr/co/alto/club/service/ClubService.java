package kr.co.alto.club.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface ClubService {

	public Map<String, Object> clubMainList() throws DataAccessException;
	public Map<String, Object> clubSearchList(String mem_id) throws DataAccessException;
	public void clubOpen(Map<String, Object> clubMap) throws DataAccessException;
}
