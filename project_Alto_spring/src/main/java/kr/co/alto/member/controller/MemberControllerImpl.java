package kr.co.alto.member.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
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
import org.springframework.web.util.WebUtils;

import kr.co.alto.common.base.BaseController;
import kr.co.alto.hobby.dto.HobbysubDTO;
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
		
		rttr.addAttribute("memberEmail", memberDTO.getMem_id());
		rttr.addAttribute("memberName", memberDTO.getMem_name());
		
		return "redirect:/member/registerAuth.do";
	}
	
	@RequestMapping(value = "/registerAuth.do", method=RequestMethod.GET)
	public ModelAndView loginView(@RequestParam("memberEmail") String memberEmail, 
								@RequestParam("memberName") String memberName, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		mav.setViewName(viewName);
		mav.addObject("memberEmail", memberEmail);
		mav.addObject("memberName", memberName);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/registerEmail.do", method = RequestMethod.GET)
	public ModelAndView emailConfirm(String memberEmail, String authKey, String memberName, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		mav.setViewName(viewName);
		memberService.memberAuth(memberEmail, authKey);
		mav.addObject("memberEmail", memberEmail);
		mav.addObject("authKey", authKey);
		mav.addObject("memberName", memberName);
		
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
	public String loginPost(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
		logger.info("loginDTO"+loginDTO.getMem_id());
		MemberDTO memberDTO = memberService.login(loginDTO);
				
		if(memberDTO == null || !BCrypt.checkpw(loginDTO.getMem_pwd(), memberDTO.getMem_pwd())) {
			model.addAttribute("result", "loginCheck");			
			model.addAttribute("mem_id", loginDTO.getMem_id());
			return "redirect:/member/loginFrm.do";
		}
		
		if(memberDTO.getAuthkey() == 0) {
			model.addAttribute("result", "authCheck");
			return "redirect:/member/loginFrm.do";
		}
		
		if (memberDTO.getDel_yn().equals("Y")) {
			model.addAttribute("result", "delCheck");
			return "redirect:/member/loginFrm.do";
		}
		
		model.addAttribute("member",memberDTO);
		httpSession.setAttribute("mem_name_s", memberDTO.getMem_name());
		
		if (loginDTO.isUseCookie()) {
			int amount = 60*60*24*7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
			memberService.keepLogin(memberDTO.getMem_id(), httpSession.getId(), sessionLimit);
		}
		
		if (httpSession.getAttribute("URL") == null) {
			httpSession.setAttribute("URL", "/alto/main.do");
		}
				
		return "main";
	}

	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("logout");
		
		Object URL = session.getAttribute("URL");
		Object obj = session.getAttribute("login");
		if(obj != null) {
			memberDTO = (MemberDTO) obj;
			session.removeAttribute("login");
			session.removeAttribute("mem_name_s");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				memberService.keepLogin(memberDTO.getMem_id(), "none", new Date());
			}
			
		}
		logger.info("URL :"+ URL);		
		response.sendRedirect((String) URL);
	}

	@Override
	@RequestMapping(value = "/findPw.do", method = RequestMethod.POST)
	public ModelAndView findPw(MemberDTO memberDTO, HttpServletRequest request) throws Exception {
		logger.info("mem_pwd? : "+memberDTO.getMem_id());
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		if(memberService.findPwCheck(memberDTO) == 0) {
			logger.info("memberPWCheck");
			mav.addObject("msg", "가입되지 않은 이메일입니다.");
			mav.setViewName("/member/findPwFrm");
			
			return mav;
		}else {
			memberService.findPw(memberDTO.getMem_id());
			mav.addObject("mem_id", memberDTO.getMem_id());
			mav.setViewName(viewName);
			
			return mav;
		}
		
	}
	
	@Override
	@RequestMapping(value = "/selectMemberInfo.do", method = RequestMethod.POST)
	public ResponseEntity<Object> selectMemberInfo(@RequestParam("mem_id")String mem_id, HttpServletRequest request) throws Exception {
				
		Map<String, Object> map = new HashMap<>();
		List<HobbysubDTO> memberInfoList = memberService.selectMemberInfo(mem_id);
		map.put("memberInfoList", memberInfoList);
		
		ResponseEntity<Object> resEntity = new ResponseEntity<Object>(map, HttpStatus.OK);
		
		return resEntity;
	}

}
