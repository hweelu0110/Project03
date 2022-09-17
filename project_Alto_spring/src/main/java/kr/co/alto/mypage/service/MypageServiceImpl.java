package kr.co.alto.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.area.dto.AreaDTO;
import kr.co.alto.cla.dao.ClassDAO;
import kr.co.alto.cla.dto.ClassDTO;
import kr.co.alto.cla.dto.ReviewDTO;
import kr.co.alto.club.dto.ClubListDTO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.item.dao.ItemDAO;
import kr.co.alto.item.dto.ItemDTO;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.mypage.dao.MypageDAO;
import kr.co.alto.mypage.dto.likeDTO;

@Service("mypageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDAO mypageDAO;

	@Autowired
	private ClassDAO classDAO;
	
	@Autowired
	private ItemDAO itemDAO;
	
	@Override
	public Map<String, Object> selectMyList(String mem_id) throws Exception {
		Map<String, Object> mypageMap = new HashMap<>();
		
		List<HobbyDTO> hobbyList = mypageDAO.selectHobbyList(mem_id);
		List<AreaDTO> areaList = mypageDAO.selectMyAreaList(mem_id);
		
		mypageMap.put("hobbyList", hobbyList);
		mypageMap.put("areaList", areaList);
		
		return mypageMap;
	}
	
	@Override
	public MemberDTO selectMemInfo(String mem_id) throws Exception {
		return mypageDAO.selectMemInfo(mem_id);
	}
	
	@Override
	public void modMemInfo(MemberDTO memberDTO) throws Exception {
		mypageDAO.modMemInfo(memberDTO);		
	}

	@Override
	public String pwCheck(String mem_id) throws Exception {
		return mypageDAO.pwCheck(mem_id);
	}

	@Override
	public void pwUpdate(String mem_id, String hashedPw) throws Exception {
		mypageDAO.pwUpdate(mem_id, hashedPw);		
	}

	@Override
	public void delMember(String mem_id) throws Exception {
		mypageDAO.delMember(mem_id);
	}

	@Override
	public void updateImg(String mem_img, String mem_id) throws Exception {
		mypageDAO.updateImg(mem_img, mem_id);
	}
	
	@Override
	public List<likeDTO> selectLikeList(String mem_id) throws Exception {
		return mypageDAO.selectLikeList(mem_id);
	}
	
	@Override
	public Map<String, Object> selectActivList(String mem_id) throws Exception {
		Map<String, Object> myActivMap = new HashMap<>();
		
		List<HobbyDTO> hobbyList = mypageDAO.selectHobbyList(mem_id);
		List<AreaDTO> areaList = mypageDAO.selectMyAreaList(mem_id);
		
		myActivMap.put("hobbyList", hobbyList);
		myActivMap.put("areaList", areaList);
		
		List<likeDTO> memlikeList = mypageDAO.selectLikeList(mem_id);		
		List<ClubListDTO> clubList = mypageDAO.selectActivClubList(mem_id);
		List<ClassDTO> classList = mypageDAO.selectOrderClassList(mem_id);
		
		myActivMap.put("memlikeList", memlikeList);
		myActivMap.put("clubList", clubList);
		myActivMap.put("classList", classList);
		
		return myActivMap;
	}	
	
	@Override
	public Map<String, Object> selectAllLikeList(String mem_id) throws Exception {
		Map<String, Object> mylikeMap = new HashMap<>();
		
		List<HobbyDTO> hobbyList = mypageDAO.selectHobbyList(mem_id);
		List<AreaDTO> areaList = mypageDAO.selectMyAreaList(mem_id);
		
		mylikeMap.put("hobbyList", hobbyList);
		mylikeMap.put("areaList", areaList);
		
		List<likeDTO> memlikeList = mypageDAO.selectLikeList(mem_id);		
		List<ClubListDTO> clubList = mypageDAO.selectLikeClubList(mem_id);				
		List<ClassDTO> classList = mypageDAO.selectLikeClassList(mem_id);	
		List<ItemDTO> itemList = mypageDAO.selectLikeItemList(mem_id);	
		
		mylikeMap.put("memlikeList", memlikeList);
		mylikeMap.put("clubList", clubList);
		mylikeMap.put("classList", classList);
		mylikeMap.put("itemList", itemList);
		
		return mylikeMap;	
	}

	@Override
	public void insertLike(String codeNum, String codeType, String mem_id) throws Exception {
		Map<String, String> codeNumMap = new HashMap<>();
		
		codeNumMap.put("club_code", "");
		codeNumMap.put("class_code", "");
		codeNumMap.put("item_code", "");
		
		if (codeType.equals("club_code")) {
			codeNumMap.put("club_code", codeNum);
		}else if (codeType.equals("class_code")) {
			codeNumMap.put("class_code", codeNum);
		}else if (codeType.equals("item_code")) {
			codeNumMap.put("item_code", codeNum);
		}
		
		mypageDAO.insertLike(codeNumMap, mem_id);
		
	}

	@Override
	public void deletLike(String codeNum, String codeType, String mem_id) throws Exception {
		Map<String, String> codeNumMap = new HashMap<>();
		
		codeNumMap.put("club_code", "");
		codeNumMap.put("class_code", "");
		codeNumMap.put("item_code", "");
		
		if (codeType.equals("club_code")) {
			codeNumMap.put("club_code", codeNum);
		}else if (codeType.equals("class_code")) {
			codeNumMap.put("class_code", codeNum);
		}else if (codeType.equals("item_code")) {
			codeNumMap.put("item_code", codeNum);
		}
		
		mypageDAO.deletLike(codeNumMap, mem_id);
	}

	@Override
	public Map<String, Object> myMainList(String mem_id) throws Exception {
		Map<String, Object> myMainMap = new HashMap<>();
		
		if (!mem_id.equals("")) {
			List<likeDTO> memlikeList = mypageDAO.selectLikeList(mem_id);		
			
			myMainMap.put("memlikeList", memlikeList);
		}
		
		List<ClubListDTO> activClubList = mypageDAO.selectActivClubList(mem_id);
		List<ClubListDTO> likeClubList = mypageDAO.selectLikeClubList(mem_id);
		List<ClassDTO> classList = mypageDAO.selectOrderClassList(mem_id);
		
		myMainMap.put("activClubList", activClubList);
		myMainMap.put("likeClubList", likeClubList);
		myMainMap.put("classList", classList);
		
		return myMainMap;
	}

	@Override
	public List<ClubListDTO> selectActivClubList(String mem_id) throws Exception {
		return mypageDAO.selectActivClubList(mem_id);
	}

	@Override
	public Map selectAddItemList(String mem_id) throws Exception {
		
		Map<String, Object> addList = new HashMap<>();
		
		List<ClassDTO> classList = mypageDAO.selectAddClass(mem_id);
		List<ItemDTO> itemList = mypageDAO.selectAddItem(mem_id);
		
		addList.put("classList", classList);
		addList.put("itemList", itemList);
		
		return addList;
	}

	@Override
	public Map<String, Object> selectReviewList(String mem_id) throws Exception {

		Map<String, Object> reviewList = new HashMap<>();
		
		List<ReviewDTO> classReviewList = classDAO.userReviewList(mem_id);
		List<kr.co.alto.item.dto.ReviewDTO> itemReviewList = itemDAO.userReviewList(mem_id);
		
		reviewList.put("classReviewList", classReviewList);
		reviewList.put("itemReviewList", itemReviewList);
		
		return reviewList;
	}	
	
}
