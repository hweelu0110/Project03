package kr.co.alto.cart.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface CartDAO {

	public int insertNewCart(Map cartMap) throws DataAccessException;
	public List selectClassCart(String mem_id) throws DataAccessException;
	public List selectItemCart(String mem_id) throws DataAccessException;
	public int cartGoods(Map cartMap) throws DataAccessException;
	public int editCart(Map cartMap) throws DataAccessException;
	public int deleteCartGoods(Map cartMap) throws DataAccessException;
	
}
