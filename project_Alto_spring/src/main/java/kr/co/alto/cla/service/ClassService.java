package kr.co.alto.cla.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.cla.dto.ClassDTO;

public interface ClassService {

	public List<ClassDTO> listClass(Map listMap) throws Exception;
	public String addNewArticle(Map classMap) throws Exception;
	public void modClass(Map<String, Object> classMap) throws Exception;
	public Map classDetail(String class_code) throws Exception;
	
	public Map<String, Object> classMainList(String mem_id) throws Exception;
	
	public int addClassReview(Map reviewMap) throws Exception;
	public int removeClassReview(String cmt_num) throws Exception;
}
