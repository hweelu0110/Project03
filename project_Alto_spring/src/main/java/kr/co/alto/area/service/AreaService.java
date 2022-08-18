package kr.co.alto.area.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.area.dto.AreaDTO;


public interface AreaService {
	
	public List<AreaDTO> listAreas() throws DataAccessException;
	public Map<String, Object> listAreas(String mem_id) throws DataAccessException;
	
	public void memAreaUpdate(String mem_id, Map<String, Object> memAreaMap) throws DataAccessException;
}
