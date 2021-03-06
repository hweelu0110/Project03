package kr.co.alto.mypage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.co.alto.area.dto.AreaDTO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.member.dto.MemberDTO;

@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HobbyDTO> selectHobbyList(String mem_id) throws DataAccessException {
		return sqlSession.selectList("mapper.hobby.memMainHobbyList", mem_id);
	}
	
	@Override
	public List<AreaDTO> selectMyAreaList(String mem_id) throws DataAccessException {
		return sqlSession.selectList("mapper.area.selectMyAreaList", mem_id);
	}

	
	@Override
	public void modMemInfo(MemberDTO memberDTO) throws DataAccessException {
		sqlSession.update("mapper.member.modMemInfo", memberDTO);		
	}

	@Override
	public String pwCheck(String mem_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.pwCheck", mem_id);
	}

	@Override
	public void pwUpdate(String mem_id, String hashPw) throws DataAccessException {
		Map<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("mem_pwd", hashPw);
		sqlSession.update("mapper.member.pwUpdate", map);		
	}

	@Override
	public void delMember(String mem_id) throws DataAccessException {
		sqlSession.update("mapper.member.delMember", mem_id);
	}

	@Override
	public void updateImg(String mem_img, String mem_id) throws DataAccessException {
		Map<String, Object> map = new HashMap<>();
		map.put("mem_img", mem_img);
		map.put("mem_id", mem_id);
		sqlSession.update("mapper.member.updateImg", map);
	}

	
}
