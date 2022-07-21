package kr.co.alto.member.dao;


import java.util.Date;

import org.springframework.dao.DataAccessException;

import kr.co.alto.member.dto.LoginDTO;
import kr.co.alto.member.dto.MemberDTO;


public interface MemberDAO {
	
	public void createAuthKey(String memberEmail, String authKey) throws DataAccessException;
	public void memberAuth(String memberEmail, String authKey) throws DataAccessException;
	
	public void register(MemberDTO memberDTO) throws DataAccessException;
	public String idCnt(String mem_id) throws DataAccessException;
	public MemberDTO login(LoginDTO loginDTO) throws DataAccessException;
	
	public void keepLogin(String mem_id, String sessionId, Date sessionLimit) throws DataAccessException;
	public MemberDTO checkSessionKey(String value) throws DataAccessException;
	
	public int findPwCheck(MemberDTO memberDTO) throws DataAccessException;
	public int findPw(String mem_pwd, String mem_id) throws DataAccessException;
}
