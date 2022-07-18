package kr.co.alto.club.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("clubDAO")
public class ClubDAOImpl implements ClubDAO {
	@Autowired
	private SqlSession sqlSession;
}
