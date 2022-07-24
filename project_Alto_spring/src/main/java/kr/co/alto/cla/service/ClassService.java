package kr.co.alto.cla.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.cla.dto.ClassDTO;

public interface ClassService {

	public List<ClassDTO> listClass() throws Exception;
	public int addNewArticle(Map classMap) throws Exception;
}
