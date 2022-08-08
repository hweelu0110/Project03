package kr.co.alto.hobby.dao;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.dto.HobbysubDTO;


public interface HobbyDAO {
	public List<HobbyDTO> selectAllHobbyList() throws DataAccessException;

	public List<HobbysubDTO> selectHobbysubList(HashMap<String, String> codeList) throws DataAccessException;
=======
import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.hobby.dto.HobbyDTO;


public interface HobbyDAO {
	public List<HobbyDTO> selectAllHobbyList() throws DataAccessException;
>>>>>>> refs/remotes/origin/woosb
}
