package kr.co.alto.item.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.cla.dto.ClassDTO;
import kr.co.alto.hobby.dao.HobbyDAO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.item.dao.ItemDAO;
import kr.co.alto.item.dto.ImageDTO;
import kr.co.alto.item.dto.ItemDTO;
import kr.co.alto.mypage.dao.MypageDAO;
import kr.co.alto.mypage.dto.likeDTO;

@Service("itemService")
@Transactional(propagation = Propagation.REQUIRED)
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private HobbyDAO hobbyDAO;
	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public List<ItemDTO> listItem(Map listMap) throws Exception {
		List<ItemDTO> itemList = itemDAO.selectAllitemList(listMap);
		return itemList;
	}

	@Override
	public String addNewArticle(Map itemMap) throws Exception {
		String item_code = itemDAO.insertNewItem (itemMap);
		itemMap.put("item_code", item_code);
		itemDAO.insertNewImage(itemMap);
		return item_code;
	}

	@Override
	public Map<String, Object> itemDetail(String item_code) throws Exception {

		ItemDTO itemDTO = itemDAO.selectItem(item_code);
		List<ImageDTO> imageFileList = itemDAO.selectImageFileList(item_code);		
		List reviewList = itemDAO.selectReviewList(item_code);
		
		Map<String, Object> itemMap = new HashMap<>();
		itemMap.put("itemDTO", itemDTO);
		itemMap.put("imageFileList", imageFileList);	
		itemMap.put("reviewList", reviewList);

		return itemMap;
	}

	@Override
	public void modItem(Map<String, Object> itemMap) throws Exception {

		itemDAO.updateItem(itemMap);
		
		List<ImageDTO> imageFileList = (List<ImageDTO>) itemMap.get("imageFileList");
		
		if(imageFileList != null && imageFileList.size() != 0) {
			int added_img_num = Integer.parseInt((String)itemMap.get("added_img_num"));
			int pre_img_num = Integer.parseInt((String)itemMap.get("pre_img_num"));
			
			itemDAO.updateImageFile(itemMap);
		}
	}

	@Override
	public Map<String, Object> itemMainMap(String mem_id) throws Exception {
		Map<String, Object> itemMainMap = new HashMap<>();
		
		List<HobbyDTO> AllHobbyList = hobbyDAO.selectAllHobbyList();
		
		if (!mem_id.equals("")) {
			List<likeDTO> memlikeList = mypageDAO.selectLikeList(mem_id);		
			
			itemMainMap.put("memlikeList", memlikeList);
		}
		
		itemMainMap.put("AllHobbyList", AllHobbyList);
		
		return itemMainMap;
	}

}
