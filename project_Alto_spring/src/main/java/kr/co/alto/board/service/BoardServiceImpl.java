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
	public Map<String, Object> listArticles(Map<String, Object> pagingMap) throws Exception {
		Map<String, Object> articlesMap = new HashMap<>();
		
		List<BoardDTO> articlesList = boardDAO.selectAllArticlesList(pagingMap);
		
		String club_code = (String) pagingMap.get("club_code");
		int totArtices = boardDAO.selectTotArticles(club_code);
		
		articlesMap.put("articlesList", articlesList);
		articlesMap.put("totArtices", totArtices);
			
		return articlesMap;
	}

	@Override
	public int addNewArticle(Map articleMap) throws Exception {
		// dao 호출
		int notice_num = boardDAO.insertNewArticle(articleMap);		//글 정보를 저장한 후 글번호를 가져옴.
		articleMap.put("notice_num", notice_num);						//글번호를 articleMap에 저장한 후 
				
		boardDAO.insertNewFile(articleMap);						//이미지 정보를 저장함
		
		return notice_num;
	
	}	

	@Override
	public Map<String, Object> viewArticle(Map<String, Object> viewMap) throws Exception {
		int notice_num = (int) viewMap.get("notice_num");
		String mem_id = (String) viewMap.get("mem_id");
		
		BoardDTO boardDTO = boardDAO.selectArticle(notice_num);
		
		String writerId = boardDTO.getMem_id();
		if (mem_id == null || !(mem_id.equals(writerId))) {
			//조회수 1 증가
			boardDAO.updateViewCount(notice_num);
			boardDTO = boardDAO.selectArticle(notice_num);	
		}
		
		List<FileDTO> fileList = boardDAO.selectFileList(notice_num);
		
		Map<String, Object> articleMap = new HashMap<>();
		articleMap.put("article", boardDTO);
		articleMap.put("fileList", fileList);
		
		return articleMap;
	}
	
	@Override
	public FileDTO selectFile(int fileNo) {
		return boardDAO.selectFileInfo(fileNo);
	}

	@Override
	public void modArticle(Map<String, Object> articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
		
		List<FileDTO> fileList = (List<FileDTO>) articleMap.get("fileList");
		List<FileDTO> modAddFileList = (List<FileDTO>) articleMap.get("modAddFileList");
		
		if (fileList != null && fileList.size() != 0) {
			int add_file_num = (int) articleMap.get("add_file_num");
			int pre_file_num = (int) articleMap.get("pre_file_num");
			
			if (pre_file_num < add_file_num) {				//기존 이미지도 수정하고 새 이미지도 추가한 경우
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

}
