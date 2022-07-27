package kr.co.alto.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.alto.common.base.BaseController;
import kr.co.alto.member.controller.MemberController;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.mypage.service.MypageService;


@Controller("mypageController")
@RequestMapping("/mypage")
public class MypageControllerImpl extends BaseController implements MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MypageService mypageService;

	@Override
	@RequestMapping(value = "/modMemberInfo.do", method = RequestMethod.POST)
	public ResponseEntity modMemInfo(MemberDTO memberDTO, HttpServletRequest request) throws Exception {
		logger.info("modMemberInfo");
		System.out.println(memberDTO.getMem_id());
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		
		try {
			
			mypageService.modMemInfo(memberDTO);			
			
			message = "<script>";
			message += " alert('회원 정보 수정 완료');";
			message += " location.href='"+request.getContextPath()+"/mypage/infoEditFrm.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/mypage/infoEditFrm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		}
				
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/pwCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int pwCheck(MemberDTO memberDTO) throws Exception {
		String mem_pwd = mypageService.pwCheck(memberDTO.getMem_id());
		if (memberDTO == null || !BCrypt.checkpw(memberDTO.getMem_pwd(), mem_pwd)) {
			return 0;
		}
		return 1;
	}

	@Override
	@RequestMapping(value = "/pwUpdate.do", method = RequestMethod.POST)
	public ResponseEntity pwUpdate(String mem_id, String mem_pwd1, HttpServletRequest request, HttpSession session)
			throws Exception {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		
		String hashedPw = BCrypt.hashpw(mem_pwd1, BCrypt.gensalt());
		
		try {
			
			mypageService.pwUpdate(mem_id, hashedPw);
			session.invalidate();
			
			message = "<script>";
			message += " alert('비밀번호 변경 완료. 다시 로그인 해주세요.');";
			message += " location.href='"+request.getContextPath()+"/member/loginFrm.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/mypage/infoEditFrm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		}
				
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/delMember.do", method = RequestMethod.POST)
	public ResponseEntity delMember(String mem_id, HttpServletRequest request, HttpSession session) throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;		
		try {
			
			mypageService.delMember(mem_id);
			session.invalidate();
			
			message = "<script>";
			message += " alert('회원 탈퇴 완료');";
			message += " location.href='"+request.getContextPath()+"/main.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/mypage/delMemFrm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		}
				
		return resEnt;
	}

		
}
