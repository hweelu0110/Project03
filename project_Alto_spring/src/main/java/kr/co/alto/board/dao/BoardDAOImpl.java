package kr.co.alto.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.dto.FileDTO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
		
	// 글정보를 게시판 테이블에 추가한 후 글 번호를 반환함
	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int notice_num  = selectNewArticleNo();
		
		articleMap.put("notice_num", notice_num);				
		sqlSession.insert("mapper.board.insertNewArticle", articleMap);	
		
		return notice_num;		
	}

	private int selectNewArticleNo() {
		return sqlSession.selectOne("mapper.board.selectNewArticleNo");
	}	

	@Override
	public void insertNewFile(Map articleMap) throws DataAccessException {
		List<FileDTO> fileList = (List<FileDTO>) articleMap.get("fileList");
		int notice_num = (Integer) articleMap.get("notice_num");
		
		int fileNo = selectNewFileNo();
		
		if(fileList != null && fileList.size() != 0 ) {
			for(FileDTO fileDTO : fileList) {
				fileDTO.setFileNo(++fileNo);
				fileDTO.setNotice_num(notice_num);
			}
			
			sqlSession.insert("mapper.board.insertNewFile", fileList);
		}		
	}
	
	private int selectNewFileNo() {
		return sqlSession.selectOne("mapper.board.selectNewFileNo");
	}

	@Override
	public BoardDTO selectArticle(int notice_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectArticle", notice_num);
	}
	
	@Override
	public List<FileDTO> selectFileList(int notice_num) throws DataAccessException {
		List<FileDTO> fileList = sqlSession.selectList("mapper.board.selectFileList", notice_num);
		return fileList;
	}
	
	@Override
	public FileDTO selectFileInfo(int fileNo) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectFileInfo", fileNo);
	}
	
	@Override
	public void updateArticle(Map<String, Object> articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateArticle", articleMap);
		
	}
	
	@Override
	public void updateFile(Map<String, Object> articleMap) throws DataAccessException {
		List<FileDTO> fileList = (List<FileDTO>) articleMap.get("fileList");
		int notice_num = Integer.parseInt((String)articleMap.get("notice_num"));
		
		for (int i = fileList.size()-1; i>=0; i--) {
			FileDTO fileDTO = fileList.get(i);
			String fileName = fileDTO.getFileName();
			if (fileName == null) {		//기존 이미지를 수정하지 않는 경우는 수정할 필요없음
				fileList.remove(i);
			} 
			else {
				fileDTO.setNotice_num(notice_num);
			}
		}
		
		if (fileList != null && fileList.size() != 0) {
			sqlSession.update("mapper.board.updateFile", fileList);		//수정한 이미지만 갱신함
		}
		
	}
	
	@Override
	public void insertModNewFile(Map<String, Object> articleMap) throws DataAccessException {
		List<FileDTO> modAddFileList = (List<FileDTO>) articleMap.get("modAddFileList");
		int notice_num = Integer.parseInt((String)articleMap.get("notice_num"));
		
		int fileNo = selectNewFileNo();
		
		for (FileDTO fileDTO : modAddFileList) {
			fileDTO.setNotice_num(notice_num);
			fileDTO.setFileNo(++fileNo);
		}
		
		sqlSession.insert("mapper.board.insertModNewFile", modAddFileList);		
	}
	
	@Override
	public void deleteArticle(int notice_num) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteArticle", notice_num);		
	}
	
	@Override
	public void deleteModFile(FileDTO fileDTO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteModFile", fileDTO);		
	}

	@Override
	public void updateViewCount(int notice_num) throws DataAccessException {
		sqlSession.update("mapper.board.updateViewCount", notice_num);		
	}

	@Override
	public List<BoardDTO> selectAllArticlesList(Map<String, Object> pagingMap) throws DataAccessException {
		List<BoardDTO> articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList", pagingMap);
		return articlesList;
	}

	@Override
	public int selectTotArticles(String club_code) throws DataAccessException {		
		int totArticles = sqlSession.selectOne("mapper.board.selectTotArticles", club_code);
		return totArticles;
	}
	
}
