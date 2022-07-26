package kr.co.alto.item.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.item.dto.ItemDTO;


public interface ItemService {

	public List<ItemDTO> listItem(String sort) throws Exception;
	public String addNewArticle(Map itemMap) throws Exception;
}
