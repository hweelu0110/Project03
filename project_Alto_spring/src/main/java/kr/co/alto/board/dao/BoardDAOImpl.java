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
	@Override
	public List<BoardDTO> selectAllArticlesList() throws DataAccessException {
		List<BoardDTO> articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList");
		return articlesList;
	}
	
	// 글정보를 게시판 테이블에 추가한 후 글 번호를 반환함
	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int notice_num  = selectNewArticleNO();
		articleMap.put("notice_num", notice_num);
		
		sqlSession.insert("mapper.board.insertNewArticle", articleMap);		
		return notice_num ;
	}
	private int selectNewArticleNO() {
		return sqlSession.selectOne("mapper.board.selectNewArticleNO");
	}

	@Override
	public void insertNewFile(Map articleMap) throws DataAccessException {
		List<FileDTO> FileList = (List<FileDTO>) articleMap.get("FileList");
		int notice_num = (Integer) articleMap.get("notice_num");
		
		int FileNO = selectNewFileNO();
		
		if(FileList != null && FileList.size() != 0 ) {
			for(FileDTO fileDTO : FileList) {
				fileDTO.setFileNO(++FileNO);
				fileDTO.setNotice_num(notice_num);
			}
			
			sqlSession.insert("mapper.board.insertNewFile", FileList);
		}
		
	}
	private int selectNewFileNO() {
		return sqlSession.selectOne("mapper.board.selectNewFileNO");
	}

	@Override
	public BoardDTO selectArticle(int notice_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectArticle", notice_num);
	}
	@Override
	public List<FileDTO> selectFileList(int notice_num) throws DataAccessException {
		List<FileDTO> FileList = sqlSession.selectList("mapper.board.selectFileList", notice_num);
		
		return FileList;
	}
	@Override
	public void updateArticle(Map<String, Object> articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateArticle", articleMap);
		
	}
	@Override
	public void updateFile(Map<String, Object> articleMap) throws DataAccessException {
		List<FileDTO> FileList = (List<FileDTO>) articleMap.get("FileList");
		int notice_num = Integer.parseInt((String)articleMap.get("notice_num"));
		
		for (int i = FileList.size()-1; i>=0; i--) {
			FileDTO fileDTO = FileList.get(i);
			String FileName = fileDTO.getFileName();
			if (FileName == null) {		//기존 이미지를 수정하지 않는 경우는 수정할 필요없음
				FileList.remove(i);
			} 
			else {
				fileDTO.setNotice_num(notice_num);
			}
		}
		
		if (FileList != null && FileList.size() != 0) {
			sqlSession.update("mapper.board.updateFile", FileList);		//수정한 이미지만 갱신함
		}
		
	}
	@Override
	public void insertModNewFile(Map<String, Object> articleMap) throws DataAccessException {
		List<FileDTO> modAddFileList = (List<FileDTO>) articleMap.get("modAddFileList");
		int notice_num = Integer.parseInt((String)articleMap.get("notice_num"));
		
		int FileNO = selectNewFileNO();
		
		for (FileDTO fileDTO : modAddFileList) {
			fileDTO.setNotice_num(notice_num);
			fileDTO.setFileNO(++FileNO);
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
	public List<BoardDTO> selectAllArticlesList(Map<String, Integer> pagingMap) throws DataAccessException {
		List<BoardDTO> articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList", pagingMap);
		return articlesList;
	}

	@Override
	public int selectTotArticles() throws DataAccessException {
		int totArticles = sqlSession.selectOne("mapper.board.selectTotArticles");
		return totArticles;
	}
	
}
