package kr.co.alto.album.service;

import java.util.Map;

import kr.co.alto.album.dto.ImageDTO;

public interface AlbumService {
	
	public Map<String, Object> albumList(Map<String, Object> pagingMap) throws Exception;
	
	public int addNewAlbum(Map albumMap) throws Exception;
	
	public Map<String, Object> albumDetail(Map<String, Object> viewMap) throws Exception;
	
	public void modAlbum(Map<String, Object> albumMap) throws Exception;

	public void removeAlbum(int album_num) throws Exception;

	public void removeModImage(ImageDTO imageDTO) throws Exception;	
}
