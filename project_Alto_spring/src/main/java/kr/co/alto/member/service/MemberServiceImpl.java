package kr.co.alto.member.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.alto.mail.MailUtils;
import kr.co.alto.mail.TempKey;
import kr.co.alto.member.dao.MemberDAO;
import kr.co.alto.member.dto.LoginDTO;
import kr.co.alto.member.dto.MemberDTO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;	
	
	@Inject
	private JavaMailSender mailSender;
	
	@Transactional
	@Override
	public void register(MemberDTO memberDTO) throws Exception {
		memberDAO.register(memberDTO);
		
		String key = new TempKey().getKey(50,false);
		memberDAO.createAuthKey(memberDTO.getMem_id(), key);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[ALTO] 회원가입 인증 메일입니다.");
		sendMail.setText(
				"<h1>메일인증</h1>" +
						"<br/>"+memberDTO.getMem_name()+"님 "+
						"<br/>ALTO에 회원가입해주셔서 감사합니다."+
						"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
						"<a href='http://localhost:8080/alto/member/registerEmail.do?memberEmail="+
						memberDTO.getMem_id() + "&authKey="+ key +
						"' target='_blenk'>[이메일 인증 확인]</a>");
		sendMail.setFrom("projectalto03@gmail.com", "김지선");
		sendMail.setTo(memberDTO.getMem_id());
		sendMail.send();
		
	}

	@Override
	public void memberAuth(String memberEmail, String authKey) throws Exception {
		memberDAO.memberAuth(memberEmail, authKey);		
	}

	@Override
	public String idCnt(String mem_id) throws Exception {
		return memberDAO.idCnt(mem_id);
	}

	@Override
	public MemberDTO login(LoginDTO loginDTO) throws Exception {
		return memberDAO.login(loginDTO);
	}

	@Override
	public void keepLogin(String mem_id, String sessionId, Date sessionLimit) throws Exception {
		memberDAO.keepLogin(mem_id, sessionId, sessionLimit);
	}

	@Override
	public MemberDTO checkLoginBefore(String value) throws Exception {
		return memberDAO.checkSessionKey(value);
	}	
	
}
