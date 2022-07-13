package kr.co.alto.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.member.dto.MemberDTO;


public interface MemberDAO {
	public List<MemberDTO> selectAllMemberList() throws DataAccessException;
	public int insertMember(MemberDTO memberDTO) throws DataAccessException;
	public int deleteMember(String id) throws DataAccessException;
	
	//member join
	public void register(MemberDTO memberDTO) throws Exception;
	public int idCnt(MemberDTO memberDTO) throws Exception;
	public void createAuthKey(String memberEmail, String authKey) throws Exception;
	public void memberAuth(String memberEmail) throws Exception;

}
