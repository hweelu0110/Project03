package kr.co.alto.item.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.item.dto.ImageDTO;
import kr.co.alto.item.dto.ItemDTO;

public interface ItemDAO {

	public List<ItemDTO> selectAllitemList(Map listMap) throws DataAccessException;
	public String insertNewItem(Map itemMap) throws DataAccessException;
	public void insertNewImage(Map itemMap) throws DataAccessException;
	
	public ItemDTO selectItem(String item_code) throws DataAccessException;
	public List<ImageDTO> selectImageFileList(String item_code) throws DataAccessException;
	
	public void updateItem(Map<String, Object> itemMap) throws DataAccessException;
	public void updateImageFile(Map<String, Object> itemMap) throws DataAccessException;
	
}
