package kr.co.alto.item.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.item.dto.ItemDTO;


public interface ItemService {

	public List<ItemDTO> listItem(Map listMap) throws Exception;
	public List<ItemDTO> keywordItem(String keyword) throws Exception;
	public String addNewArticle(Map itemMap) throws Exception;
	
	public void modItem(Map<String, Object> itemMap) throws Exception;
	
	public Map<String, Object> itemMainMap(String mem_id) throws Exception;
	
	public Map itemDetail(String item_code) throws Exception;
	public int addItemReview(Map reviewMap) throws Exception;
	public int removeItemReview(String cmt_num) throws Exception;
}
