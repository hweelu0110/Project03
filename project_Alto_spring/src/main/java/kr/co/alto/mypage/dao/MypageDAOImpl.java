package kr.co.alto.mypage.dao;

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
}
