package kr.co.alto.club.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.club.dto.ClubListDTO;
import kr.co.alto.club.dto.JoinDTO;

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

	@Override
	public List<HashMap<String, Object>> selectTopHobby() throws DataAccessException {
		return sqlSession.selectList("mapper.club.topHobby");
	}

	@Override
	public List<ClubListDTO> selectTopHobbyList(String hobby_code) throws DataAccessException {
		return sqlSession.selectList("mapper.club.topHobbyList", hobby_code);
	}

	@Override
	public List<ClubListDTO> selectHobClubList(String hobby_code) throws DataAccessException {
		return sqlSession.selectList("mapper.club.selectHobClubList", hobby_code);
	}

	@Override
	public ClubDTO selectClubInfo(String club_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.club.selectClubInfo", club_code);
	}

	@Override
	public String selectNewJoinCode() throws DataAccessException {
		String join_code = sqlSession.selectOne("mapper.club.selectNewJoinCode");
		return join_code;
	}

	@Override
	public void clubJoin(Map<String, Object> joinMap) throws DataAccessException {
		sqlSession.insert("mapper.club.clubJoin", joinMap);
	}

	@Override
	public void clubManagerJoin(Map<String, Object> joinMap) throws DataAccessException {
		sqlSession.insert("mapper.club.clubManagerJoin", joinMap);
	}

	@Override
	public List<JoinDTO> selectClubMemberList(String club_code) throws DataAccessException {
		List<JoinDTO> clubMemberList = sqlSession.selectList("mapper.club.selectClubMemberList", club_code);
		
		return clubMemberList;
	}

	@Override
	public void clubOut(Map<String, Object> joinMap) throws DataAccessException {
		sqlSession.delete("mapper.club.clubOut", joinMap);
	}

	@Override
	public void addClubMemberNum(String club_code) throws DataAccessException {
		sqlSession.update("mapper.club.addClubMemberNum", club_code);
	}

	@Override
	public void minClubMemberNum(String club_code) throws DataAccessException {
		sqlSession.update("mapper.club.minClubMemberNum", club_code);
	}

	@Override
	public void addOutCount(String club_code) throws DataAccessException {
		sqlSession.update("mapper.club.addOutCount", club_code);
	}

	@Override
	public String chkManager(Map<String, Object> joinMap) throws DataAccessException {
		return sqlSession.selectOne("mapper.club.chkManager", joinMap);
	}

	@Override
	public String nextManager(String club_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.club.nextManager", club_code);
	}

	@Override
	public void changeManagerJoin(Map<String, Object> joinMap) throws DataAccessException {
		sqlSession.update("mapper.club.changeManagerJoin", joinMap);
	}
	
	@Override
	public void changeManagerClub(Map<String, Object> joinMap) throws DataAccessException {
		sqlSession.update("mapper.club.changeManagerClub", joinMap);
	}

	@Override
	public void deleteClub(String club_code) throws DataAccessException {
		sqlSession.delete("mapper.club.deleteClub", club_code);
	}

	@Override
	public String selectClubHobbyCode(String club_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.club.selectClubHobbyCode", club_code);
	}

	@Override
	public void clubUpdate(Map<String, Object> clubInfoMap) throws DataAccessException {
		sqlSession.update("mapper.club.updateClubInfo", clubInfoMap);
	}
	
}
