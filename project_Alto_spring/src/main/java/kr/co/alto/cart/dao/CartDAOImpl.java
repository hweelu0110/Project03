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
	public int insertNewCart(Map cartMap) throws DataAccessException {
		return sqlSession.insert("mapper.cart.insertCart", cartMap);
	}

	
	@Override
	public List selectClassCart(String mem_id) throws DataAccessException {
		return sqlSession.selectList("mapper.cart.selectClassCart", mem_id);
	}


	@Override
	public List selectItemCart(String mem_id) throws DataAccessException {
		return sqlSession.selectList("mapper.cart.selectItemCart", mem_id);
	}


	@Override
	public int cartGoods(Map cartMap) throws DataAccessException {
		Integer testnum = sqlSession.selectOne("mapper.cart.selectCartGoods", cartMap);
		return testnum = testnum == null ? 0 : testnum;
	}


	@Override
	public int editCart(Map cartMap) throws DataAccessException {
		return sqlSession.update("mapper.cart.updateCartGoods", cartMap);
	}


	@Override
	public int deleteCartGoods(Map cartMap) throws DataAccessException {
		return sqlSession.delete("mapper.cart.deleteCartGoods", cartMap);
	}

	@Override
	public int quanEditCart(Map cartMap) throws DataAccessException {
		return sqlSession.update("mapper.cart.updateQuantityGoods", cartMap);
	}

}
