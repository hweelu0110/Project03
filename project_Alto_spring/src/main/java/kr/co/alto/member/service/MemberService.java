package kr.co.alto.member.service;

import java.util.Date;

import kr.co.alto.member.dto.LoginDTO;
import kr.co.alto.member.dto.MemberDTO;


public interface MemberService {
	
	public void register(MemberDTO memberDTO) throws Exception;
	public String idCnt(String mem_id) throws Exception;
	
	public MemberDTO login(LoginDTO loginDTO) throws Exception;
	public void memberAuth(String memberEmail, String authKey) throws Exception;
	
	public void keepLogin(String mem_id, String sessionId, Date sessionLimit) throws Exception;
	public MemberDTO checkLoginBefore(String value) throws Exception;
	
}
