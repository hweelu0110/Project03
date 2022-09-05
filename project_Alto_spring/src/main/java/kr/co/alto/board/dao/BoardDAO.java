package kr.co.alto.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.dto.FileDTO;
public interface BoardDAO {
	
	public List<BoardDTO> selectAllArticlesList(Map<String, Object> pagingMap)  throws DataAccessException;
	public int selectTotArticles(String club_code)  throws DataAccessException;
	
	public int insertNewArticle(Map articleMap) throws DataAccessException;	
	public void insertNewFile(Map articleMap) throws DataAccessException;

	public BoardDTO selectArticle(int notice_num) throws DataAccessException;
	
	public List<FileDTO> selectFileList(int notice_num) throws DataAccessException;
	public FileDTO selectFileInfo(int fileNo) throws DataAccessException;

	public void updateArticle(Map<String, Object> articleMap) throws DataAccessException;
	public void updateFile(Map<String, Object> articleMap) throws DataAccessException;

	public void insertModNewFile(Map<String, Object> articleMap) throws DataAccessException;

	public void deleteArticle(int notice_num) throws DataAccessException;
	public void deleteModFile(FileDTO fileDTO) throws DataAccessException;
	
	public void updateViewCount(int notice_num) throws DataAccessException;
	

}
