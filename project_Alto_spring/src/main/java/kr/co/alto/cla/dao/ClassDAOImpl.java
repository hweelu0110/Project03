package kr.co.alto.cla.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.cla.dto.ClassDTO;
import kr.co.alto.cla.dto.ImageDTO;

@Repository("classDAO")
public class ClassDAOImpl implements ClassDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ClassDTO> selectAllclassList(String sort) throws DataAccessException {
		List<ClassDTO> classlist = sqlSession.selectList("mapper.class.selectAllclassList", sort);
		return classlist;
	}

	@Override
	public String insertNewClass(Map classMap) throws DataAccessException {
		String class_code = selectNewClass_code();
		classMap.put("class_code", class_code);
		System.out.println("=============");
		System.out.println(classMap);
		System.out.println("=============");
		sqlSession.insert("mapper.class.insertNewClass", classMap);
		return class_code;
	}

	private String selectNewClass_code() {
		int class_codeN = sqlSession.selectOne("mapper.class.selectNewclass_codeN");
		String class_code = sqlSession.selectOne("mapper.class.selectNewclass_code", class_codeN);
		System.out.println(class_codeN);
		System.out.println(class_code);
		return class_code;
	}

	@Override
	public void insertNewImage(Map classMap) throws DataAccessException {
		List<ImageDTO> imageFileList = (ArrayList) classMap.get("imageFileList");
		String class_code = (String) classMap.get("class_code");
		int imageFileNO = selectNewImageFileNO();
		for(ImageDTO imageDTO : imageFileList){
			imageDTO.setImageFileNO(++imageFileNO);
			imageDTO.setClass_code(class_code);
		}
		sqlSession.insert("mapper.class.insertNewImage",imageFileList);
	}

	private int selectNewImageFileNO() {
		return sqlSession.selectOne("mapper.class.selectNewImageFileNO");
	}

}
