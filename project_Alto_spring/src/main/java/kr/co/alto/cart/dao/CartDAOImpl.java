package kr.co.alto.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public String insertNewCart(Map cartMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public List selectClassCart(String mem_id) throws DataAccessException {
		List cartClassList  = sqlSession.selectList("mapper.cart.selectClassCart", mem_id);
		return cartClassList;
	}


	@Override
	public List selectItemCart(String mem_id) throws DataAccessException {
		List cartItemList = sqlSession.selectList("mapper.cart.selectItemCart", mem_id);
		return cartItemList;
	}

}
