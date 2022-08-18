package kr.co.alto.hobby.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.dto.HobbysubDTO;


@Repository("hobbyDAO")
public class HobbyDAOImpl implements HobbyDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HobbyDTO> selectAllHobbyList() throws DataAccessException {
		List<HobbyDTO> hobbyList = sqlSession.selectList("mapper.hobby.selectAllHobbyList");
		return hobbyList;
	}
	
	@Override
	public List<HobbysubDTO> selectHobbysubList(HashMap<String, String> codeList) throws DataAccessException {
		List<HobbysubDTO> hobbysubList = sqlSession.selectList("mapper.hobby.selectHobbysubList", codeList);
		return hobbysubList;
	}

	/*
	 * 셀렉트문용 리스트
	 */
	@Override
	public List<HobbysubDTO> selectHobbysubList2(String main_code) throws DataAccessException {
		List<HobbysubDTO> hobbysubList2 = sqlSession.selectList("mapper.hobby.selectHobbysubList2", main_code);
		return hobbysubList2;
	}
	
	@Override
	public List<HobbyDTO> selectMyHobbyList(String mem_id) throws DataAccessException {
		return sqlSession.selectList("mapper.hobby.memMainHobbyList", mem_id);
	}

	@Override
	public List<HobbyDTO> selectMyHobbysubList(String mem_id) throws DataAccessException {
		return sqlSession.selectList("mapper.hobby.memSubHobbyList", mem_id);
	}

	@Override
	public void delMemHobby(String mem_id) throws DataAccessException {
		sqlSession.delete("mapper.hobby.delMemHobby", mem_id);
	}

	@Override
	public void updateMemHobby(Map<String, Object> memHobbyMap) throws DataAccessException {
		sqlSession.insert("mapper.hobby.updateMemHobby", memHobbyMap);		
	}

	@Override
	public List<HobbysubDTO> selectSubHobbyList(String hobby_code) throws DataAccessException {
		return sqlSession.selectList("mapper.hobby.selectSubHobbyList", hobby_code);
	}

}
