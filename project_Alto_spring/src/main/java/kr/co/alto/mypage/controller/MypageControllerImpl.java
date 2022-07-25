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

		
}
