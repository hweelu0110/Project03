package kr.co.alto.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.area.dto.AreaDTO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.mypage.dao.MypageDAO;

@Service("mypageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;

	
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

	
}
