package kr.co.alto.cla.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.cla.dto.ClassDTO;
import kr.co.alto.cla.dto.ImageDTO;
import kr.co.alto.cla.dto.ReviewDTO;

public interface ClassDAO {

	public List<ClassDTO> selectAllclassList(Map listMap) throws DataAccessException;
	public List<ClassDTO> keywordClass(String keyword) throws DataAccessException;
	public String insertNewClass(Map classMap) throws DataAccessException;
	public void insertNewImage(Map classMap) throws DataAccessException;
	public ClassDTO selectClass(String class_code) throws DataAccessException;
	public List<ImageDTO> selectImageFileList(String class_code) throws DataAccessException;
	public void updateClass(Map<String, Object> classMap) throws DataAccessException;
	public void updateImageFile(Map<String, Object> classMap) throws DataAccessException;
	public List selectReviewList(String class_code) throws DataAccessException;
	public int insertNewClassreview(Map reviewMap) throws DataAccessException;
	public int deleteClassReview(String cmt_num) throws DataAccessException;
	public List<ReviewDTO> userReviewList(String mem_id) throws DataAccessException;
}
