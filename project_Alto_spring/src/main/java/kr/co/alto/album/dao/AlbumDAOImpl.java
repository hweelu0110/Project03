package kr.co.alto.album.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.album.dto.AlbumDTO;
import kr.co.alto.album.dto.ImageDTO;

@Repository("albumDAO")
public class AlbumDAOImpl implements AlbumDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertNewAlbum(Map albumMap) throws DataAccessException {
		int album_num = selectNewAlbumNo();
		albumMap.put("album_num", album_num);
		
		sqlSession.insert("mapper.album.insertNewAlbum", albumMap);
		return album_num;
	}
	
	private int selectNewAlbumNo() {
		return sqlSession.selectOne("mapper.album.selectNewAlbumNo");
	}
	
	@Override
	public void insertNewImage(Map albumMap) throws DataAccessException {
		List<ImageDTO> imageFileList = (List<ImageDTO>) albumMap.get("imageFileList");
		int album_num = (Integer)albumMap.get("album_num");
		int imageFileNo = selectNewImageFileNo();
		
		if(imageFileList != null && imageFileList.size() != 0) {
			for (ImageDTO imageDTO : imageFileList) {
				imageDTO.setImageFileNo(++imageFileNo);
				imageDTO.setAlbum_num(album_num);
			}
			
			sqlSession.insert("mapper.album.insertNewImage", imageFileList);
			
		}
		
	}
	
	private int selectNewImageFileNo() {
		return sqlSession.selectOne("mapper.album.selectNewImageFileNo");
	}
	
	@Override
	public AlbumDTO selectAlbum(int album_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.album.selectAlbum", album_num);
	}
	
	@Override
	public List<ImageDTO> selectImageFileList(int album_num) throws DataAccessException {
		List<ImageDTO> imageFileList = sqlSession.selectList("mapper.album.selectImageFileList", album_num);
		return imageFileList;
	}	
	
	@Override
	public void updateAlbum(Map<String, Object> albumMap) throws DataAccessException {
		sqlSession.update("mapper.album.updateAlbum", albumMap);		
	}
	
	//기존이미지 수정
	@Override
	public void updateImageFile(Map<String, Object> albumMap) throws DataAccessException {
		List<ImageDTO> imageFileList = (List<ImageDTO>) albumMap.get("imageFileList");
		int album_num = Integer.parseInt((String)albumMap.get("album_num"));
		
		for (int i = imageFileList.size()-1; i>=0; i--) {
			ImageDTO imageDTO = imageFileList.get(i);
			String imageFileName = imageDTO.getImageFileName();
			if (imageFileName == null) {		//기존 이미지를 수정하지 않는 경우는 수정할 필요없음
				imageFileList.remove(i);
			} 
			else {
				imageDTO.setAlbum_num(album_num);
			}
		}
		
		if (imageFileList != null && imageFileList.size() != 0) {
			sqlSession.update("mapper.album.updateImageFile", imageFileList);		//수정한 이미지만 갱신함
		}
		
	}
		
	//새 이미지도 추가한 경우
	@Override
	public void insertModNewImage(Map<String, Object> albumMap) throws DataAccessException {
		List<ImageDTO> modAddImageFileList = (List<ImageDTO>) albumMap.get("modAddImageFileList");
		int album_num = Integer.parseInt((String)albumMap.get("album_num"));
		
		int imageFileNo = selectNewImageFileNo();
		
		for (ImageDTO imageDTO : modAddImageFileList) {
			imageDTO.setAlbum_num(album_num);
			imageDTO.setImageFileNo(++imageFileNo);
		}
		
		sqlSession.insert("mapper.album.insertModNewImage", modAddImageFileList);
				
	}

	@Override
	public void deleteAlbum(int album_num) throws DataAccessException {
		sqlSession.delete("mapper.album.deleteAlbum", album_num);
		
	}

	@Override
	public void deleteModImage(ImageDTO imageDTO) throws DataAccessException {
		sqlSession.delete("mapper.album.deleteModImage", imageDTO);
		
	}

	@Override
	public void updateViewCount(int album_num) throws DataAccessException {
		sqlSession.update("mapper.album.updateViewCount", album_num);
		
	}

	@Override
	public List<AlbumDTO> selectAllAlbumList(Map<String, Object> pagingMap) throws DataAccessException {
		List<AlbumDTO> albumList = sqlSession.selectList("mapper.album.selectAllAlbumList", pagingMap);
		return albumList;
	}

	@Override
	public int selectTotAlbum() throws DataAccessException {
		int totArticles = sqlSession.selectOne("mapper.album.selectTotAlbum");
		return totArticles;
	}	
	
}
