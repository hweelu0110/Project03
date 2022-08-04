package kr.co.alto.cla.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.cla.dao.ClassDAO;
import kr.co.alto.cla.dto.ClassDTO;
import kr.co.alto.cla.dto.ImageDTO;

@Service("classService")
@Transactional(propagation = Propagation.REQUIRED)
public class ClassServiceImpl implements ClassService {

	@Autowired
	private ClassDAO classDAO;
	
	@Override
	public List<ClassDTO> listClass(Map listMap) throws Exception {
		List<ClassDTO> classList = classDAO.selectAllclassList(listMap);
		return classList;
	}

	@Override
	public String addNewArticle(Map classMap) throws Exception {
		String class_code = classDAO.insertNewClass (classMap);
		classMap.put("class_code", class_code);
		classDAO.insertNewImage(classMap);
		return class_code;
	}

	@Override
	public Map<String, Object> editClass(String class_code) throws Exception {
		
		System.out.println("서비스 : "+class_code);
		
		// 조회수를 갱신하기 전 먼저 글번호에 해당되는 글정보를 조회
		ClassDTO classDTO = classDAO.selectClass(class_code);
		
		//이미지 부분 정보 요청
		List<ImageDTO> imageFileList = classDAO.selectImageFileList(class_code);		
		
		Map<String, Object> classMap = new HashMap<>();
		classMap.put("classDTO", classDTO);
		classMap.put("imageFileList", imageFileList);		

		return classMap;
	}

}
