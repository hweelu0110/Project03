package kr.co.alto.album.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.album.dao.AlbumDAO;
import kr.co.alto.album.dto.AlbumDTO;
import kr.co.alto.album.dto.ImageDTO;
import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.dto.FileDTO;


@Service("albumService")
@Transactional(propagation = Propagation.REQUIRED)
public class AlbumServiceImpl implements AlbumService {
	@Autowired
	private AlbumDAO albumDAO;
	@Override
	public List<AlbumDTO> Albumlist() throws Exception {
		List<AlbumDTO> albumList = albumDAO.selectAllAlbumList();
		return albumList;
	}
	@Override
	public int addNewAlbum(Map albumMap) throws Exception {
		int album_num = albumDAO.insertNewAlbum(albumMap);
		albumMap.put("album_num", album_num);
		
		albumDAO.insertNewImage(albumMap);
		
		return album_num;
	}
	@Override
	public Map<String, Object> Albumdetail(int album_num) throws Exception {
		
		Map<String, Object> albumMap = new HashMap<>();
		
		AlbumDTO albumDTO = albumDAO.selectAlbum(album_num);
		
		//이미지 부분 정보 요청
		List<ImageDTO> imageFileList = albumDAO.selectImageFileList(album_num);
		
		albumMap.put("album", albumDTO);
		albumMap.put("imageFileList", imageFileList);
		
		return albumMap;
	}
	@Override
	public void modAlbum(Map<String, Object> albumMap) throws Exception {
		albumDAO.updateAlbum(albumMap);
		
		List<ImageDTO> imageFileList = (List<ImageDTO>) albumMap.get("imageFileList");
		List<ImageDTO> modAddImageFileList = (List<ImageDTO>) albumMap.get("modAddImageFileList");
		
		if (imageFileList != null && imageFileList.size() != 0) {
			int added_img_num = Integer.parseInt((String)albumMap.get("added_img_num"));
			int pre_img_num = Integer.parseInt((String)albumMap.get("pre_img_num"));
			
			if (pre_img_num < added_img_num) {				//기존 이미지도 수정하고 새 이미지도 추가한 경우
				albumDAO.updateImageFile(albumMap);		//기존 이미지 수정
				albumDAO.insertModNewImage(albumMap);		//새 이미지 추가
			}
			else {											//기존 이미지를 수정만 한 경우
				albumDAO.updateImageFile(albumMap);
			}
		}
		// 새 이미지를 추가한 경우
		else if (modAddImageFileList != null && modAddImageFileList.size() != 0) {													
			albumDAO.insertModNewImage(albumMap);
		}
	}
	@Override
	public void removeAlbum(int album_num) throws Exception {
		albumDAO.deleteAlbum(album_num);
		
	}
	@Override
	public void removeModImage(ImageDTO imageDTO) throws Exception {
		albumDAO.deleteModImage(imageDTO);
		
	}
	@Override
	public Map<String, Object> Albumdetail(Map<String, Object> viewMap) throws Exception {
		int album_num = (int) viewMap.get("album_num");
		String mem_id = (String) viewMap.get("mem_id");
		
		//조회수를 갱신하기 전 먼저 글번호에 해당되는 글번호를 조회
		AlbumDTO albumDTO = albumDAO.selectAlbum(album_num);
		
		//비로그인 상태와
		//로그인한 아이디와 게시글의 글쓴이 아이디를 비교함
		String writerId = albumDTO.getMem_id();
		if (mem_id == null || !(mem_id.equals(writerId))) {
			//조회수 1 증가시킴
			albumDAO.updateViewCount(album_num);
			albumDTO = albumDAO.selectAlbum(album_num);	
		}
		
		List<ImageDTO> imageFileList = albumDAO.selectImageFileList(album_num);
		
		Map<String, Object> albumMap = new HashMap<>();
		albumMap.put("album", albumDTO);
		albumMap.put("imageFileList", imageFileList);
		
		return albumMap;
	}
	@Override
	public Map<String, Integer> Albumlist(Map<String, Integer> pagingMap) throws Exception {
		Map albumsMap = new HashMap();
		
		List<AlbumDTO> albumList = albumDAO.selectAllAlbumList(pagingMap);
		int totArtices = albumDAO.selectTotAlbum();
		
		albumsMap.put("albumList", albumList);
		albumsMap.put("totArtices", totArtices);
			
		return albumsMap;
	}
	
}
