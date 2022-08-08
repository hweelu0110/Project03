package kr.co.alto.member.dao;

<<<<<<< HEAD
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.member.dto.LoginDTO;
import kr.co.alto.member.dto.MemberDTO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void createAuthKey(String memberEmail, String authKey) throws DataAccessException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("authKey", authKey);
		
		sqlSession.selectOne("mapper.member.createAuthKey", map);
		
	}

	@Override
	public void memberAuth(String memberEmail, String authKey) throws DataAccessException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("authKey", authKey);
		
		sqlSession.update("mapper.member.memberAuth", map);
		
	}

	@Override
	public void register(MemberDTO memberDTO) throws DataAccessException {
		sqlSession.insert("mapper.member.register", memberDTO);	
	}

	@Override
	public String idCnt(String mem_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.idCnt", mem_id);
	}

	@Override
	public MemberDTO login(LoginDTO loginDTO) throws DataAccessException {
		System.out.println("loginDTO"+loginDTO.getMem_pwd());
		return sqlSession.selectOne("mapper.member.login", loginDTO);
	}

	@Override
	public void keepLogin(String mem_id, String sessionId, Date sessionLimit) throws DataAccessException {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mem_id", mem_id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("sessionLimit", sessionLimit);
		
		sqlSession.update("mapper.member.keepLogin", paramMap);
	}

	@Override
	public MemberDTO checkSessionKey(String value) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.checkSessionKey", value);
	}

	@Override
	public int findPwCheck(MemberDTO memberDTO) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.findPwCheck", memberDTO);
	}

	@Override
	public int findPw(String mem_pwd, String mem_id) throws DataAccessException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_pwd", mem_pwd);
		map.put("mem_id", mem_id);
		return sqlSession.delete("mapper.member.findPw", map);
=======
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.member.dto.MemberDTO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> selectAllMemberList() throws DataAccessException {
		List<MemberDTO> membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}

	@Override
	public int insertMember(MemberDTO memberDTO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberDTO);
		return result;
	}

	@Override
	public int deleteMember(String id) throws DataAccessException {
		int reault = sqlSession.delete("mapper.member.deleteMember", id);
		return reault;
>>>>>>> refs/remotes/origin/woosb
	}
}
