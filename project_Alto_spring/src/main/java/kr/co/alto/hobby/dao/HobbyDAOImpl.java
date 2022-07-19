package kr.co.alto.hobby.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

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

}
