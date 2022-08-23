package kr.co.alto.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.board.dao.BoardDAO;
import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.dto.FileDTO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardDTO> listArticles() throws Exception {
		List<BoardDTO> ariclesList = boardDAO.selectAllArticlesList();
		return ariclesList;
	}

	@Override
	public int addNewArticle(Map articleMap) throws Exception {
		// dao 호출
		int notice_num = boardDAO.insertNewArticle(articleMap);		//글 정보를 저장한 후 글번호를 가져옴.
		articleMap.put("notice_num", notice_num);						//글번호를 articleMap에 저장한 후 
		
		int club_code = boardDAO.insertNewArticle(articleMap);
		articleMap.put("club_code", club_code);
		
		boardDAO.insertNewFile(articleMap);						//이미지 정보를 저장함
		
		return notice_num;
	
	}

	@Override
	public Map<String, Object> viewArticle(int notice_num) throws Exception {
		
		Map<String, Object> articleMap = new HashMap<>();
		
		BoardDTO boardDTO = boardDAO.selectArticle(notice_num);
		
		//이미지 부분 정보 요청
		List<FileDTO> FileList = boardDAO.selectFileList(notice_num);
		
		articleMap.put("board", boardDTO);
		articleMap.put("FileList", FileList);
		
		return articleMap;
	}

	@Override
	public void modArticle(Map<String, Object> articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
		
		List<FileDTO> FileList = (List<FileDTO>) articleMap.get("FileList");
		List<FileDTO> modAddFileList = (List<FileDTO>) articleMap.get("modAddFileList");
		
		if (FileList != null && FileList.size() != 0) {
			int added_img_num = Integer.parseInt((String)articleMap.get("added_img_num"));
			int pre_img_num = Integer.parseInt((String)articleMap.get("pre_img_num"));
			
			if (pre_img_num < added_img_num) {				//기존 이미지도 수정하고 새 이미지도 추가한 경우
				boardDAO.updateFile(articleMap);		//기존 이미지 수정
				boardDAO.insertModNewFile(articleMap);		//새 이미지 추가
			}
			else {											//기존 이미지를 수정만 한 경우
				boardDAO.updateFile(articleMap);
			}
		}
		// 새 이미지를 추가한 경우
		else if (modAddFileList != null && modAddFileList.size() != 0) {													
			boardDAO.insertModNewFile(articleMap);
		}
	}
		
	

	@Override
	public void removeArticle(int notice_num) throws Exception {
		boardDAO.deleteArticle(notice_num);
		
	}

	@Override
	public void removeModFile(FileDTO fileDTO) throws Exception {
		boardDAO.deleteModFile(fileDTO);
		
	}

	@Override
	public Map<String, Object> viewArticle(Map<String, Object> viewMap) throws Exception {
		int notice_num = (int) viewMap.get("notice_num");
		String mem_id = (String) viewMap.get("mem_id");
		
		//조회수를 갱신하기 전 먼저 글번호에 해당되는 글번호를 조회
		BoardDTO boardDTO = boardDAO.selectArticle(notice_num);
		
		//비로그인 상태와
		//로그인한 아이디와 게시글의 글쓴이 아이디를 비교함
		String writerId = boardDTO.getMem_id();
		if (mem_id == null || !(mem_id.equals(writerId))) {
			//조회수 1 증가시킴
			boardDAO.updateViewCount(notice_num);
			boardDTO = boardDAO.selectArticle(notice_num);	
		}
		
		List<FileDTO> FileList = boardDAO.selectFileList(notice_num);
		
		Map<String, Object> articleMap = new HashMap<>();
		articleMap.put("board", boardDTO);
		articleMap.put("FileList", FileList);
		
		return articleMap;
	}

	@Override
	public Map<String, Integer> listArticles(Map<String, Integer> pagingMap) throws Exception {
		Map articlesMap = new HashMap<>();
		
		List<BoardDTO> ariclesList = boardDAO.selectAllArticlesList(pagingMap);
		int totArtices = boardDAO.selectTotArticles();
		
		articlesMap.put("ariclesList", ariclesList);
		articlesMap.put("totArtices", totArtices);
			
		return articlesMap;
	}

}
