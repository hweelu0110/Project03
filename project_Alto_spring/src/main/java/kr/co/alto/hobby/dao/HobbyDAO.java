package kr.co.alto.hobby.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.dto.HobbysubDTO;


public interface HobbyDAO {
	public List<HobbyDTO> selectAllHobbyList() throws DataAccessException;

	public List<HobbysubDTO> selectHobbysubList(HashMap<String, String> codeList) throws DataAccessException;

	public List<HobbyDTO> selectMyHobbyList(String mem_id) throws DataAccessException;
	public List<HobbyDTO> selectMyHobbysubList(String mem_id) throws DataAccessException;

	public void delMemHobby(String mem_id) throws DataAccessException;

	public void updateMemHobby(HashMap<String, Object> map) throws DataAccessException;
}
