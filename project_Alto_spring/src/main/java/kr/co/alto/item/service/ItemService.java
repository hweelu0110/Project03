package kr.co.alto.item.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.item.dto.ItemDTO;


public interface ItemService {

	public List<ItemDTO> listItem(Map listMap) throws Exception;
	public String addNewArticle(Map itemMap) throws Exception;
	
	public Map<String, Object> editItem(String item_code) throws Exception;
	public void modItem(Map<String, Object> itemMap) throws Exception;
}
