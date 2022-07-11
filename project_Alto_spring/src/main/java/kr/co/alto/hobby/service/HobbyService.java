package kr.co.alto.hobby.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.hobby.dto.HobbyDTO;


public interface HobbyService {
	public List<HobbyDTO> listHobbys() throws DataAccessException;
}
