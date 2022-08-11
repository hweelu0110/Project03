package kr.co.alto.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.alto.area.dto.AreaDTO;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.mypage.dto.likeDTO;

public interface MypageDAO {

	public void modMemInfo(MemberDTO memberDTO) throws DataAccessException;
	
	public String pwCheck(String mem_id) throws DataAccessException;
	public void pwUpdate(String mem_id, String hashPw) throws DataAccessException;
	
	public void delMember(String mem_id) throws DataAccessException;

	public void updateImg(String mem_img, String mem_id) throws DataAccessException;

	public List<HobbyDTO> selectHobbyList(String mem_id) throws DataAccessException;
	public List<AreaDTO> selectMyAreaList(String mem_id) throws DataAccessException;

	public List<likeDTO> selectLikeList(String mem_id) throws DataAccessException;
	
	public void insertLike(Map<String, String> codeNumMap, String mem_id) throws DataAccessException;
	public void deletLike(Map<String, String> codeNumMap, String mem_id) throws DataAccessException;

}
