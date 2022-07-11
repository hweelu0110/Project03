package kr.co.alto.hobby.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.hobby.dto.HobbyDTO;


@Repository("hobbyDAO")
public class HobbyDAOImpl implements HobbyDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HobbyDTO> selectAllHobbyList() throws DataAccessException {
		List<HobbyDTO> hobbyList = sqlSession.selectList("mapper.hobby.selectAllHobbyList");

		return hobbyList;
	}

}
