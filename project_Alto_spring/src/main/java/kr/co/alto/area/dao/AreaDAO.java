package kr.co.alto.area.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.area.dto.AreaDTO;

public interface AreaDAO {
	public List<AreaDTO> selectAllAreaList() throws DataAccessException;

	public List<AreaDTO> selectMyAreaList(String mem_id) throws DataAccessException;

	public void delMemArea(String mem_id) throws DataAccessException;

	public void updateMemArea(Map memAreaMap) throws DataAccessException;
}
