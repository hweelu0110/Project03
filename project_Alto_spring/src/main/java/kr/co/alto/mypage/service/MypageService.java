package kr.co.alto.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.mypage.dto.likeDTO;

public interface MypageService {
	
	public MemberDTO selectMemInfo(String mem_id) throws Exception;
	public void modMemInfo(MemberDTO memberDTO) throws Exception;
	
	public String pwCheck(String mem_id) throws Exception;
	public void pwUpdate(String mem_id, String hashedPw) throws Exception;
	
	public void delMember(String mem_id) throws Exception;

	public void updateImg(String mem_img, String mem_id) throws Exception;

	public Map<String, Object> selectMyList(String mem_id) throws Exception;
	
	public Map<String, Object> selectActivList(String mem_id);

	public List<likeDTO> selectLikeList(String mem_id) throws DataAccessException;
	public Map<String, Object> selectAllLikeList(String mem_id) throws Exception;
		
	public void insertLike(String codeNum, String codeType, String mem_id) throws Exception;
	public void deletLike(String codeNum, String codeType, String mem_id) throws Exception;
	
	
}
