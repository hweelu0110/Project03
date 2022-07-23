package kr.co.alto.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.alto.board.dao.BoardDAO;
import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.utils.PagingVO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardDTO> Noticelist() throws Exception {
		 List<BoardDTO> boardList = boardDAO.selectAllArticlesList();
		 return boardList;
		
	}
	
	public String boardList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = boardDAO.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", boardDAO.selectBoard(vo));
		return "board/boardPaging";
	}

	@Override
	public int addNewNotice(Map noticeMap) throws Exception {
		//dao 호출
		int notice_num = boardDAO.insertNewArticle(noticeMap);
		noticeMap.put("notice_num", notice_num);
		
		return notice_num;
	}

}
