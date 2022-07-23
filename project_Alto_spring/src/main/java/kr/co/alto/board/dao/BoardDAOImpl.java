package kr.co.alto.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.dto.FileDTO;
import kr.co.alto.board.utils.PagingVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> selectAllArticlesList() throws DataAccessException {
		List<BoardDTO> articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList");
		return articlesList;
	}
	
	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardDTO> selectBoard(PagingVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 글정보를 게시판 테이블(T-BOARD)에 추가한 후 글 번호를 반환함
	@Override
	public int insertNewArticle(Map noticeMap) throws DataAccessException {
		int notice_num = selectNewArticleNO();
		 noticeMap.put("notice_num", notice_num);
		 
		 sqlSession.insert("mapper.board.insertNewArticle", noticeMap);
		return notice_num;
	}
	
	// 기게시글 번호의 MAX값 + 1 구함
	private int selectNewArticleNO() {
		return sqlSession.selectOne("mapper.board.selectNewArticleNO");
	}

	@Override
	public void insertNewFile(Map noticeMap) throws DataAccessException {
		List<FileDTO> fileList = (List<FileDTO>) noticeMap.get("fileList");
		int notice_num = (Integer)noticeMap.get("notice_num");
		
		int noticeFileNO = selectNewFileNO();
		if(fileList != null && fileList.size() != 0) {
			for (FileDTO fileDTO : fileList) {
				fileDTO.setNoticeFileNO(++noticeFileNO);
				fileDTO.setNotice_num(notice_num);
			}
			
			sqlSession.insert("mapper.board.insertNewFile", fileList);
		}
		
	}

	private int selectNewFileNO() {
		return sqlSession.selectOne("mapper.board.selectNewFileNO");
	}
}
