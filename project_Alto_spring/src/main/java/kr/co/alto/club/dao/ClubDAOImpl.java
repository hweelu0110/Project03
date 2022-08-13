package kr.co.alto.club.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.club.dto.ClubListDTO;

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
	public void clubOpen(ClubDTO clubDTO) throws DataAccessException {
		sqlSession.insert("mapper.club.clubOpen", clubDTO);		
	}

	@Override
	public List<ClubListDTO> selectBestClubList() throws DataAccessException {
		return sqlSession.selectList("mapper.club.selectBestClubList");
	}

	@Override
	public List<ClubListDTO> selectNewClubList() throws DataAccessException {
		return sqlSession.selectList("mapper.club.selectNewClubList");
	}

	@Override
	public List<ClubListDTO> selectPeoClubList() throws DataAccessException {
		return sqlSession.selectList("mapper.club.selectPeoClubList");
	}
}
