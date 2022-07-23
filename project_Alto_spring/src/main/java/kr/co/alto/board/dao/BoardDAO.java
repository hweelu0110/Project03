package kr.co.alto.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.utils.PagingVO;

public interface BoardDAO {
	public List<BoardDTO> selectAllArticlesList() throws DataAccessException;
	
	public int insertNewArticle(Map noticeMap) throws DataAccessException;
	
	public void insertNewFile(Map noticeMap) throws DataAccessException;
	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<BoardDTO> selectBoard(PagingVO vo);
	
	
}
