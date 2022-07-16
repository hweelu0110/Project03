package kr.co.alto.cla.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.cla.dto.ClassDTO;

public interface ClassDAO {

	public List<ClassDTO> selectAllclassList() throws DataAccessException;
}
