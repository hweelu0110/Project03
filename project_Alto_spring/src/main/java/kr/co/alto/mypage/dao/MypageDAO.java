package kr.co.alto.mypage.dao;

import org.springframework.dao.DataAccessException;

import kr.co.alto.member.dto.MemberDTO;

public interface MypageDAO {

	public void modMemInfo(MemberDTO memberDTO) throws DataAccessException;
	
	public String pwCheck(String mem_id) throws DataAccessException;
	public void pwUpdate(String mem_id, String hashPw) throws DataAccessException;
	
	public void delMember(String mem_id) throws DataAccessException;

	public void updateImg(String mem_img, String mem_id) throws DataAccessException;

}
