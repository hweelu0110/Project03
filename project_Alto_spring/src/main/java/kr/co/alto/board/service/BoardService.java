package kr.co.alto.board.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.dto.FileDTO;


public interface BoardService {
	
	public Map<String, Object> listArticles(Map<String, Object> pagingMap) throws Exception;
	
	public int addNewArticle(Map articleMap) throws Exception;
		
	public Map<String, Object> viewArticle(Map<String, Object> viewMap) throws Exception;
	
	public FileDTO selectFile(int fileNo) throws Exception;

	public void modArticle(Map<String, Object> articleMap) throws Exception;

	public void removeArticle(int notice_num) throws Exception;

	public void removeModFile(FileDTO fileDTO) throws Exception;	
	
}
