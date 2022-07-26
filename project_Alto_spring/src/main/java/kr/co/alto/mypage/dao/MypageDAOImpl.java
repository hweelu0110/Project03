package kr.co.alto.mypage.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.member.dto.MemberDTO;

@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void modMemInfo(MemberDTO memberDTO) throws DataAccessException {
		sqlSession.update("mapper.member.modMemInfo", memberDTO);		
	}

	@Override
	public String pwCheck(String mem_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.pwCheck", mem_id);
	}

	@Override
	public void psUpdate(String mem_id, String hashPw) throws DataAccessException {
		Map<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("mem_pwd", hashPw);
		sqlSession.update("mapper.member.pwUpdate", map);
		
	}
}
