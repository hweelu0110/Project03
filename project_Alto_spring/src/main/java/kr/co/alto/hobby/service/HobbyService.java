package kr.co.alto.hobby.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.dto.HobbysubDTO;


public interface HobbyService {
	public Map<String, Object> listHobbys(String mem_id) throws DataAccessException;

	public Map<String, Object> listHobbysub(HashMap<String, String> codeList,String mem_id) throws DataAccessException;
	
	public void memHobbyUpdate(String mem_id, HashMap<String, Object> memHobbyList) throws DataAccessException;
}
