package kr.co.alto.club.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("clubDAO")
public class ClubDAOImpl implements ClubDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public String selectNewClubCode() throws DataAccessException {
		String club_code = sqlSession.selectOne("mapper.club.selectNewClubCode");
		return club_code;
	}

	@Override
	public void clubOpen(Map<String, Object> clubMap) throws DataAccessException {
		sqlSession.insert("mapper.club.clubOpen", clubMap);
		
	}
}
