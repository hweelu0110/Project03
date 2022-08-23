package kr.co.alto.album.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.album.dto.AlbumDTO;
import kr.co.alto.album.dto.ImageDTO;

public interface AlbumDAO {
	public List<AlbumDTO> selectAllAlbumList() throws DataAccessException;
	
	public List<AlbumDTO> selectAllAlbumList(Map<String, Integer> pagingMap) throws DataAccessException;
	
	public int insertNewAlbum(Map albumMap) throws DataAccessException;
	
	public void insertNewImage(Map albumMap) throws DataAccessException;
	
	public AlbumDTO selectAlbum(int album_num) throws DataAccessException;
	
	public List<ImageDTO> selectImageFileList(int album_num) throws DataAccessException;
	
	public void updateAlbum(Map<String, Object> albumMap) throws DataAccessException;
	
	public void updateImageFile(Map<String, Object> albumMap) throws DataAccessException;
	
	public void insertModNewImage(Map<String, Object>  albumMap) throws DataAccessException;

	public void deleteAlbum(int album_num) throws DataAccessException;

	public void deleteModImage(ImageDTO imageDTO) throws DataAccessException;
	
	public void updateViewCount(int album_num) throws DataAccessException;

	public int selectTotAlbum() throws DataAccessException;
	}
