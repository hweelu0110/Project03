package kr.co.alto.member.service;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.member.dto.LoginDTO;
import kr.co.alto.member.dto.MemberDTO;


public interface MemberService {
	
	public void register(MemberDTO memberDTO) throws Exception;
	public int idCnt(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO login(LoginDTO loginDTO) throws Exception;
	public void memberAuth(String memberEmail, String authKey) throws Exception;
	public void keepLogin(String id, String id2, Date sessionLimit);
}
