package kr.co.alto.area.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.area.dto.AreaDTO;

public interface AreaService {
	public List<AreaDTO> listAreas() throws DataAccessException;
}
