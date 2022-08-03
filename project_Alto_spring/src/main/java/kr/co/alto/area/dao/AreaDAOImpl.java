package kr.co.alto.area.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<AreaDTO> selectMyAreaList(String mem_id) throws DataAccessException {
		return sqlSession.selectList("mapper.area.selectMyAreaList", mem_id);
	}

	@Override
	public void delMemArea(String mem_id) throws DataAccessException {
		sqlSession.delete("mapper.area.delMemArea", mem_id);		
	}

	@Override
	public void updateMemArea(Map memAreaMap) throws DataAccessException {
		sqlSession.insert("mapper.area.updateMemArea", memAreaMap);
	}

}
