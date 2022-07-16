package kr.co.alto.member.dao;

import org.springframework.dao.DataAccessException;

import kr.co.alto.member.dto.LoginDTO;
import kr.co.alto.member.dto.MemberDTO;


public interface MemberDAO {

	public void register(MemberDTO memberDTO) throws DataAccessException;
	public int idCnt(MemberDTO memberDTO) throws DataAccessException;
	public MemberDTO login(LoginDTO loginDTO) throws DataAccessException;
	
	public void createAuthKey(String memberEmail, String authKey) throws DataAccessException;
	public void memberAuth(String memberEmail, String authKey) throws DataAccessException;

}
