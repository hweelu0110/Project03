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
	}

	@Override
	public void createAuthKey(String memberEmail, String authKey) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("authKey", authKey);
		
		sqlSession.selectOne("mapper.member.createAuthKey", map);
		
	}

	@Override
	public void memberAuth(String memberEmail) throws Exception {
		sqlSession.update("mapper.member.memberAuth", memberEmail);
		
	}

	@Override
	public void register(MemberDTO memberDTO) throws Exception {
		sqlSession.insert("mapper.member.register", memberDTO);
		
	}

	@Override
	public int idCnt(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne("mapper.member.idCnt", memberDTO);
	}

	@Override
	public MemberDTO login(LoginDTO loginDTO) throws Exception {
		System.out.println("DAOloginDTO"+loginDTO.getMemberPw());
		return sqlSession.selectOne("mapper.member.login", loginDTO);
	}
}
