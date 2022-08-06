package kr.co.alto.cla.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.cla.dto.ClassDTO;
import kr.co.alto.cla.dto.ImageDTO;

public interface ClassDAO {

	public List<ClassDTO> selectAllclassList(Map listMap) throws DataAccessException;
	public String insertNewClass(Map classMap) throws DataAccessException;
	public void insertNewImage(Map classMap) throws DataAccessException;
	public ClassDTO selectClass(String class_code) throws DataAccessException;
	public List<ImageDTO> selectImageFileList(String class_code) throws DataAccessException;
	public void updateClass(Map<String, Object> classMap) throws DataAccessException;
	public void updateImageFile(Map<String, Object> classMap) throws DataAccessException;
}
