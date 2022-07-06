package kr.co.alto.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import kr.co.alto.member.dao.MemberDAO;
import kr.co.alto.member.dto.MemberDTO;


public class MemberServiceImpl implements MemberService {
	
	private MemberDAO memberDAO;
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public List<MemberDTO> listMembers() throws DataAccessException {
		List<MemberDTO> membersList = memberDAO.selectAllMemberList();
		return membersList;
	}

	@Override
	public int addMember(MemberDTO memberDTO) throws DataAccessException {
		return memberDAO.insertMember(memberDTO);
	}

	@Override
	public int removeMember(String id) throws DataAccessException {		
		return memberDAO.deleteMember(id);
	}
	
}
