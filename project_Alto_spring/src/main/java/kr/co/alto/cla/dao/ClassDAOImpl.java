package kr.co.alto.cla.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.cla.dto.ClassDTO;

@Repository("classDAO")
public class ClassDAOImpl implements ClassDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ClassDTO> selectAllclassList() throws DataAccessException {
		List<ClassDTO> classlist = sqlSession.selectList("mapper.class.selectAllclassList");
		return classlist;
	}

}
