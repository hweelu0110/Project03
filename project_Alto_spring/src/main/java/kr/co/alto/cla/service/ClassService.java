package kr.co.alto.cla.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.cla.dto.ClassDTO;

public interface ClassService {

	public List<ClassDTO> listClass(Map listMap) throws Exception;
	public String addNewArticle(Map classMap) throws Exception;
	public Map<String, Object> editClass(String class_code) throws Exception;
	public void modClass(Map<String, Object> classMap) throws Exception;
}
