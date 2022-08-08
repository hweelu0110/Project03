package kr.co.alto.album.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.album.dto.AlbumDTO;
import kr.co.alto.album.dto.ImageDTO;

public interface AlbumService {
	public List<AlbumDTO> Albumlist() throws Exception;
	public Map<String, Integer> Albumlist(Map<String, Integer> pagingMap) throws Exception;
	
	public int addNewAlbum(Map albumMap) throws Exception;
	
	public Map<String, Object> Albumdetail(Map<String, Object> viewMap) throws Exception;
	
	public Map<String, Object> Albumdetail(int album_num) throws Exception;
	
	public void modAlbum(Map<String, Object> albumMap) throws Exception;

	public void removeAlbum(int album_num) throws Exception;

	public void removeModImage(ImageDTO imageDTO) throws Exception;

	
	
	
}
