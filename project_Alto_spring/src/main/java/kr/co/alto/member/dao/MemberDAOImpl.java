package kr.co.alto.member.dao;

import java.util.HashMap;
import java.util.List;
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
	public int idCnt(MemberDTO memberDTO) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.idCnt", memberDTO);
	}

	@Override
	public MemberDTO login(LoginDTO loginDTO) throws DataAccessException {
		System.out.println("DAOloginDTO"+loginDTO.getMem_pwd());
		return sqlSession.selectOne("mapper.member.login", loginDTO);
	}
}
