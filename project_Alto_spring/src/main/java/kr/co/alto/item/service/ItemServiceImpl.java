package kr.co.alto.item.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.item.dao.ItemDAO;
import kr.co.alto.item.dto.ItemDTO;

@Service("itemService")
@Transactional(propagation = Propagation.REQUIRED)
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDAO itemDAO;
	
	@Override
	public List<ItemDTO> listItem(String sort) throws Exception {
		List<ItemDTO> itemList = itemDAO.selectAllitemList(sort);
		return itemList;
	}

	@Override
	public String addNewArticle(Map itemMap) throws Exception {
		String item_code = itemDAO.insertNewItem (itemMap);
		itemMap.put("item_code", item_code);
		itemDAO.insertNewImage(itemMap);
		return item_code;
	}

}
