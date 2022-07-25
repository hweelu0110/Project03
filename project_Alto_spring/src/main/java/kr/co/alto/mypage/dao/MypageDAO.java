package kr.co.alto.mypage.dao;

import org.springframework.dao.DataAccessException;

import kr.co.alto.member.dto.MemberDTO;

public interface MypageDAO {

	public void modMemInfo(MemberDTO memberDTO) throws DataAccessException;

}
