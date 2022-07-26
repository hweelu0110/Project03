package kr.co.alto.mypage.service;

import kr.co.alto.member.dto.MemberDTO;

public interface MypageService {

	public void modMemInfo(MemberDTO memberDTO) throws Exception;
	
	public String pwCheck(String mem_id) throws Exception;
	public void pwUpdate(String mem_id, String hashedPw) throws Exception;

}
