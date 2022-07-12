package kr.co.alto.area.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.area.dto.AreaDTO;

@Repository("areaDAO")
public class AreaDAOImpl implements AreaDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<AreaDTO> selectAllAreaList() throws DataAccessException {
		List<AreaDTO> areaList = sqlSession.selectList("mapper.area.selectAllAreaList");

		return areaList;
	}

}
