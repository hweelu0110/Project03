package kr.co.alto.hobby.service;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.dto.HobbysubDTO;


public interface HobbyService {
	public List<HobbyDTO> listHobbys() throws DataAccessException;

	public List<HobbysubDTO> listHobbysub(HashMap<String, String> codeList) throws DataAccessException;
=======
import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.hobby.dto.HobbyDTO;


public interface HobbyService {
	public List<HobbyDTO> listHobbys() throws DataAccessException;
>>>>>>> refs/remotes/origin/woosb
}
