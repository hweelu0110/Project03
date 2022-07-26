package kr.co.alto.item.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.item.dto.ItemDTO;

public interface ItemDAO {

	public List<ItemDTO> selectAllitemList(String sort) throws DataAccessException;
	public String insertNewItem(Map itemMap) throws DataAccessException;
	public void insertNewImage(Map itemMap) throws DataAccessException;
}
