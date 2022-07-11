package kr.co.alto.area.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.area.dto.AreaDTO;

public interface AreaDAO {
	public List<AreaDTO> selectAllAreaList() throws DataAccessException;
}
