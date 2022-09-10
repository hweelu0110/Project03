package kr.co.alto.cart.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface CartDAO {

	public String insertNewCart(Map cartMap) throws DataAccessException;
	public List selectClassCart(String mem_id) throws DataAccessException;
	public List selectItemCart(String mem_id) throws DataAccessException;
	
}
