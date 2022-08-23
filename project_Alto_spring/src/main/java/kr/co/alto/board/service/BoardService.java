package kr.co.alto.board.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.dto.FileDTO;


public interface BoardService {
	public List<BoardDTO> listArticles() throws Exception;
	
	public Map<String, Integer> listArticles(Map<String, Integer> pagingMap) throws Exception;
	
	public int addNewArticle(Map articleMap) throws Exception;
	
	public Map<String, Object> viewArticle(int notice_num) throws Exception;
	
	public Map<String, Object> viewArticle(Map<String, Object> viewMap) throws Exception;

	public void modArticle(Map<String, Object> articleMap) throws Exception;

	public void removeArticle(int notice_num) throws Exception;

	public void removeModFile(FileDTO fileDTO) throws Exception;
	
	
}
