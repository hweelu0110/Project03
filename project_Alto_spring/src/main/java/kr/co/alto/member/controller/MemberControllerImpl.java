package kr.co.alto.member.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.co.alto.common.base.BaseController;
import kr.co.alto.member.dto.LoginDTO;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.member.service.MemberService;

@Controller("memberController")
@RequestMapping("/member")
public class MemberControllerImpl extends BaseController implements MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberDTO memberDTO;

	@Override
	@RequestMapping(value = "/register.do", method=RequestMethod.POST)
	public String register(MemberDTO memberDTO, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("register");
		System.out.println(memberDTO.getMem_id());
		String hashedPw = BCrypt.hashpw(memberDTO.getMem_pwd(), BCrypt.gensalt());
		memberDTO.setMem_pwd(hashedPw);
		memberService.register(memberDTO);
		model.addAttribute("member", memberDTO);
		
		rttr.addFlashAttribute("msg", "가입이 완료되었습니다.");
		rttr.addAttribute("memberEmail", memberDTO.getMem_id());
		rttr.addAttribute("memberName", memberDTO.getMem_name());
		
		return "redirect:/member/registerAuth.do";
	}
	
	@RequestMapping(value = "/registerAuth.do", method=RequestMethod.GET)
	public ModelAndView loginView(HttpServletRequest request, @RequestParam("memberEmail") String memberEmail, @RequestParam("memberName") String memberName) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		mav.setViewName(viewName);
		mav.addObject("memberEmail", memberEmail);
		mav.addObject("memberName", memberName);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/registerEmail.do", method = RequestMethod.GET)
	public ModelAndView emailConfirm(String memberEmail, String authKey, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		mav.setViewName(viewName);
		memberService.memberAuth(memberEmail, authKey);
		mav.addObject("memberEmail", memberEmail);
		mav.addObject("authKey", authKey);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/idCnt.do", method = RequestMethod.POST)
	public ResponseEntity<String> idCnt(@RequestParam("mem_id") String mem_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String result = memberService.idCnt(mem_id);
		ResponseEntity<String> resEntity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/loginFrm.do",method = RequestMethod.GET)
	public String loginFrm(@ModelAttribute("loginDTO") LoginDTO loginDTO, HttpServletRequest request, Model model) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if(null != inputFlashMap) {
			model.addAttribute("msg",(String) inputFlashMap.get("msg"));
		}
		
		return viewName;
	}

	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView loginPost(LoginDTO loginDTO, HttpServletRequest request, HttpSession httpSession, RedirectAttributes rAttributes) throws Exception {
		logger.info("loginDTO"+loginDTO.getMem_id());
		MemberDTO memberDTO = memberService.login(loginDTO);
		
		ModelAndView mav = new ModelAndView();
		
		if(memberDTO == null || !BCrypt.checkpw(loginDTO.getMem_pwd(), memberDTO.getMem_pwd())) {
			rAttributes.addAttribute("result", "loginCheck");
			mav.setViewName("redirect:/member/loginFrm.do");
			return mav;
		}
		
		if(memberDTO.getAuthkey() == 0) {
			mav.addObject("Auth", memberDTO.getAuthkey());
			rAttributes.addAttribute("result", "authCheck");
			mav.setViewName("redirect:/member/loginFrm.do");
			return mav;
		}
		
		mav.addObject("member",memberDTO);
		
		if (loginDTO.isUseCookie()) {
			int amount = 60*60*24*7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
			memberService.keepLogin(memberDTO.getMem_id(), httpSession.getId(), sessionLimit);
		}
		mav.setViewName("main");
		return mav;
	}

	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("logout");
		
		String URL = (String) session.getAttribute("URL");
		logger.info("URL :"+ URL);
		session.invalidate();
		response.sendRedirect(URL);
	}

}
