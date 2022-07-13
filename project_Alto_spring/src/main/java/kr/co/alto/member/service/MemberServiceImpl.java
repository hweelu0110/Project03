package kr.co.alto.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.mail.MailUtils;
import kr.co.alto.mail.TempKey;
import kr.co.alto.member.dao.MemberDAO;
import kr.co.alto.member.dto.MemberDTO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
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
	
	@Inject
	private JavaMailSender mailSender;
	
	@Transactional
	@Override
	public void register(MemberDTO memberDTO) throws Exception {
		memberDAO.register(memberDTO);
		
		String key = new TempKey().getKey(50,false);
		memberDAO.createAuthKey(memberDTO.getId(), key);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[ALTO] 회원가입 인증 메일입니다.");
		sendMail.setText(
				"<h1>메일인증</h1>" +
						"<br/>"+memberDTO.getName()+"님 "+
						"<br/>ALTO에 회원가입해주셔서 감사합니다."+
						"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
						"<a href='http://localhost:8080/alto/member/registerEmail?memberEmail="+
						memberDTO.getId() + "&key="+ key +
						"' target='_blenk'>[이메일 인증 확인]</a>");
		sendMail.setFrom("[projectalto03@gmail.com]", "[김지선]");
		sendMail.setTo(memberDTO.getId());
		sendMail.send();
		
	}

	@Override
	public void memberAuth(String memberEmail) throws Exception {
		memberDAO.memberAuth(memberEmail);		
	}

	@Override
	public int idCnt(MemberDTO memberDTO) throws Exception {
		return memberDAO.idCnt(memberDTO);
	}

	
	
}
