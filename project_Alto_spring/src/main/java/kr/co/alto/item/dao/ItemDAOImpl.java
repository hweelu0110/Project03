package kr.co.alto.item.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.item.dto.ImageDTO;
import kr.co.alto.item.dto.ItemDTO;


@Repository("itemDAO")
public class ItemDAOImpl implements ItemDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ItemDTO> selectAllitemList(Map listMap) throws DataAccessException {
		List<ItemDTO> itemlist = sqlSession.selectList("mapper.item.selectAllitemList", listMap);
		return itemlist;
	}

	@Override
	public String insertNewItem(Map itemMap) throws DataAccessException {
		String item_code = selectNewItem_code();
		itemMap.put("item_code", item_code);
		System.out.println("=============");
		System.out.println(itemMap);
		System.out.println("=============");
		sqlSession.insert("mapper.item.insertNewItem", itemMap);
		return item_code;
	}

	private String selectNewItem_code() {
		return sqlSession.selectOne("mapper.item.selectNewitem_code");
	}

	@Override
	public void insertNewImage(Map itemMap) throws DataAccessException {
		List<ImageDTO> imageFileList = (ArrayList) itemMap.get("imageFileList");
		String item_code = (String) itemMap.get("item_code");
		int imageFileNO = selectNewImageFileNO();
		for(ImageDTO imageDTO : imageFileList){
			imageDTO.setImageFileNO(++imageFileNO);
			imageDTO.setItem_code(item_code);
		}
		sqlSession.insert("mapper.item.insertNewImage",imageFileList);
	}

	private int selectNewImageFileNO() {
		return sqlSession.selectOne("mapper.item.selectNewImageFileNO");
	}

	@Override
	public ItemDTO selectItem(String item_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.item.selectItemVi", item_code);
	}

	@Override
	public List<ImageDTO> selectImageFileList(String item_code) throws DataAccessException {

		List<ImageDTO> imageFileList = sqlSession.selectList("mapper.item.selectImageFileListVi", item_code);
		return imageFileList;
	}

	@Override
	public void updateItem(Map<String, Object> itemMap) throws DataAccessException {
		sqlSession.update("mapper.item.updateItem", itemMap);
	}

	@Override
	public void updateImageFile(Map<String, Object> itemMap) throws DataAccessException {

		List<ImageDTO> imageFileList = (ArrayList)itemMap.get("imageFileList");
		String item_code = (String)itemMap.get("item_code");
		for(int i=imageFileList.size()-1; i>=0; i--) {
			ImageDTO imageDTO = imageFileList.get(i);
			String imageFileName = imageDTO.getImageFileName();
			if(imageFileName == null) {
				imageFileList.remove(i);
			} else {
				imageDTO.setItem_code(item_code);
			}
		}
		
		if(imageFileList!=null && imageFileList.size()!=0) {
			sqlSession.update("mapper.item.updateImageFile", imageFileList);
		}
	}

	@Override
	public List selectReviewList(String item_code) throws DataAccessException {
		List reviewList = sqlSession.selectList("mapper.item.selectAllreviewList", item_code);
		return reviewList;
	}

	@Override
	public int insertNewItemreview(Map reviewMap) throws DataAccessException {
		int itemReview = sqlSession.insert("mapper.item.insertNewItemReview", reviewMap);
		return itemReview;
	}

	@Override
	public int deleteItemReview(String cmt_num) throws DataAccessException {
		int deleteItemReview = sqlSession.delete("mapper.item.deleteItemReview", cmt_num);
		return deleteItemReview;
	}

	@Override
	public List<ItemDTO> keywordItem(String keyword) throws DataAccessException {
		return sqlSession.selectList("mapper.item.keywordSearch", keyword);
	}
}
