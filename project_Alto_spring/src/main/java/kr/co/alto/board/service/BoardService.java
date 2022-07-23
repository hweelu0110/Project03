package kr.co.alto.board.service;

import java.util.List;
import java.util.Map;

import kr.co.alto.board.dto.BoardDTO;


public interface BoardService {

	public List<BoardDTO> Noticelist() throws Exception;
	
	public int addNewNotice(Map noticeMap) throws Exception;
	
}
