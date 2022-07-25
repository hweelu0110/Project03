package kr.co.alto.cla.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.cla.dto.ClassDTO;

public interface ClassService {

	public List<ClassDTO> listClass(String sort) throws Exception;
	public String addNewArticle(Map classMap) throws Exception;
}
