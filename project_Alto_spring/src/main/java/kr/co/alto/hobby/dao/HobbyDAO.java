package kr.co.alto.hobby.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.hobby.dto.HobbyDTO;


public interface HobbyDAO {
	public List<HobbyDTO> selectAllHobbyList() throws DataAccessException;
}
