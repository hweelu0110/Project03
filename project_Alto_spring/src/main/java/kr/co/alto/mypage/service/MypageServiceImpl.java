package kr.co.alto.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.mypage.dao.MypageDAO;

@Service("mypageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;

	
	@Override
	public List<HobbyDTO> selectHobbyList(String mem_id) throws Exception {
		return mypageDAO.selectHobbyList(mem_id);
	}
	
	@Override
	public void modMemInfo(MemberDTO memberDTO) throws Exception {
		mypageDAO.modMemInfo(memberDTO);		
	}

	@Override
	public String pwCheck(String mem_id) throws Exception {
		return mypageDAO.pwCheck(mem_id);
	}

	@Override
	public void pwUpdate(String mem_id, String hashedPw) throws Exception {
		mypageDAO.pwUpdate(mem_id, hashedPw);		
	}

	@Override
	public void delMember(String mem_id) throws Exception {
		mypageDAO.delMember(mem_id);
	}

	@Override
	public void updateImg(String mem_img, String mem_id) throws Exception {
		mypageDAO.updateImg(mem_img, mem_id);
	}

	
}
