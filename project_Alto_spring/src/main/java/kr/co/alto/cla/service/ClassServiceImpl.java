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
import kr.co.alto.hobby.dao.HobbyDAO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.mypage.dao.MypageDAO;
import kr.co.alto.mypage.dto.likeDTO;

@Service("classService")
@Transactional(propagation = Propagation.REQUIRED)
public class ClassServiceImpl implements ClassService {

	@Autowired
	private ClassDAO classDAO;
	@Autowired
	private HobbyDAO hobbyDAO;
	@Autowired
	private MypageDAO mypageDAO;
	
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
	public Map<String, Object> classDetail(String class_code) throws Exception {

		ClassDTO classDTO = classDAO.selectClass(class_code);
		List<ImageDTO> imageFileList = classDAO.selectImageFileList(class_code);
		List reviewList = classDAO.selectReviewList(class_code);
		
		Map<String, Object> classMap = new HashMap<>();
		classMap.put("classDTO", classDTO);
		classMap.put("imageFileList", imageFileList);	
		classMap.put("reviewList", reviewList);

		return classMap;
	}

	@Override
	public void modClass(Map<String, Object> classMap) throws Exception {

		classDAO.updateClass(classMap);
		
		List<ImageDTO> imageFileList = (List<ImageDTO>) classMap.get("imageFileList");
		
		if(imageFileList != null && imageFileList.size() != 0) {
			int added_img_num = Integer.parseInt((String)classMap.get("added_img_num"));
			int pre_img_num = Integer.parseInt((String)classMap.get("pre_img_num"));
			
			classDAO.updateImageFile(classMap);
		}
	}
	
	@Override
	public Map<String, Object> classMainList(String mem_id) throws Exception {
		Map<String, Object> classMainMap = new HashMap<>();
		
		List<HobbyDTO> AllHobbyList = hobbyDAO.selectAllHobbyList();
		
		if (!mem_id.equals("")) {
			List<likeDTO> memlikeList = mypageDAO.selectLikeList(mem_id);		
			
			classMainMap.put("memlikeList", memlikeList);
		}
		
		classMainMap.put("AllHobbyList", AllHobbyList);
		
		return classMainMap;
	}

	@Override
	public int addClassReview(Map reviewMap) throws Exception {
		int reviewNew = classDAO.insertNewClassreview(reviewMap);
		return reviewNew;
	}

	@Override
	public int removeClassReview(String cmt_num) throws Exception {
		int reviewDel = classDAO.deleteClassReview(cmt_num);
		return reviewDel;
	}

}
