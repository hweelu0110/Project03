package kr.co.alto.mypage.service;

import java.util.Map;

import kr.co.alto.member.dto.MemberDTO;

public interface MypageService {

	public void modMemInfo(MemberDTO memberDTO) throws Exception;
	
	public String pwCheck(String mem_id) throws Exception;
	public void pwUpdate(String mem_id, String hashedPw) throws Exception;
	
	public void delMember(String mem_id) throws Exception;

	public void updateImg(String mem_img, String mem_id) throws Exception;

	public Map<String, Object> selectMyList(String mem_id) throws Exception;

}
