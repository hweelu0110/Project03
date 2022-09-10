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
	public List<ClassDTO> selectAllclassList(Map listMap) throws DataAccessException {
		System.out.println("=============");
		System.out.println(listMap);
		System.out.println("=============");
		List<ClassDTO> classlist = sqlSession.selectList("mapper.class.selectAllclassList", listMap);
		return classlist;
	}

	@Override
	public String insertNewClass(Map classMap) throws DataAccessException {
		String class_code = selectNewClass_code();
		classMap.put("class_code", class_code);
		sqlSession.insert("mapper.class.insertNewClass", classMap);
		return class_code;
	}

	private String selectNewClass_code() {
		return sqlSession.selectOne("mapper.class.selectNewclass_code");
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

	@Override
	public ClassDTO selectClass(String class_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.class.selectClassVi", class_code);
	}

	@Override
	public List<ImageDTO> selectImageFileList(String class_code) throws DataAccessException {

		List<ImageDTO> imageFileList = sqlSession.selectList("mapper.class.selectImageFileListVi", class_code);
		
		return imageFileList;
	}

	@Override
	public void updateClass(Map<String, Object> classMap) throws DataAccessException {
		sqlSession.update("mapper.class.updateClass", classMap);
	}

	@Override
	public void updateImageFile(Map<String, Object> classMap) throws DataAccessException {
		
		List<ImageDTO> imageFileList = (ArrayList)classMap.get("imageFileList");
		String class_code = (String)classMap.get("class_code");
		for(int i=imageFileList.size()-1; i>=0; i--) {
			ImageDTO imageDTO = imageFileList.get(i);
			String imageFileName = imageDTO.getImageFileName();
			if(imageFileName == null) {
				imageFileList.remove(i);
			} else {
				imageDTO.setClass_code(class_code);
			}
		}
		
		if(imageFileList!=null && imageFileList.size()!=0) {
			sqlSession.update("mapper.class.updateImageFile", imageFileList);
		}
	}

	@Override
	public List selectReviewList(String class_code) throws DataAccessException {
		List reviewList = sqlSession.selectList("mapper.class.selectAllreviewList", class_code);
		return reviewList;
	}

	@Override
	public int insertNewClassreview(Map reviewMap) throws DataAccessException {
		int classReview = sqlSession.insert("mapper.class.insertNewClassReview", reviewMap);
		return classReview;
	}

	@Override
	public int deleteClassReview(String cmt_num) throws DataAccessException {
		int deleteClassReview = sqlSession.delete("mapper.class.deleteClassReview", cmt_num);
		return deleteClassReview;
	}

}
