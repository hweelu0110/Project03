package kr.co.alto.member.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.TypeReference;
import org.json.simple.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.alto.member.dto.LoginDTO;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.member.service.MemberService;

@Controller("memberController")
@RequestMapping("/member")
public class MemberControllerImpl extends MultiActionController implements MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
		
	@RequestMapping(value = "/joinTerms.do", method = RequestMethod.GET)
	public ModelAndView joinTerms(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value = "/joinFrm.do", method = RequestMethod.GET)
	public ModelAndView joinFrm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/register.do", method=RequestMethod.POST)
	public String register(MemberDTO memberDTO, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("register");
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
	@ResponseBody
	public String idCnt(@RequestBody String filterJSON, HttpServletResponse response, ModelMap model) throws Exception {
		JSONObject resMap = new JSONObject();
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			MemberDTO searchDTO = mapper.readValue(filterJSON,new com.fasterxml.jackson.core.type.TypeReference<MemberDTO>() {
			});
			int idCnt = memberService.idCnt(searchDTO);
			
			resMap.put("res", "ok");
			resMap.put("idCnt", idCnt);
		}catch (Exception e) {
			System.out.println(e.toString());
			resMap.put("res","error");
		}
		
		response.setContentType("text/html: charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(resMap);
		
		return null;
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
		MemberDTO memberDTO = memberService.login(loginDTO);
		
		if(memberDTO == null || !BCrypt.checkpw(loginDTO.getMemberPw(), memberDTO.getMem_pwd())) {
			return "/member/loginCheck.do";
		}
		
		if(memberDTO.getAuthkey() == 0) {
			model.addAttribute("Auth", memberDTO.getAuthkey());
			return "/member/registerReady.do";
		}
		
		model.addAttribute("member",memberDTO);
		
		if (loginDTO.isUseCookie()) {
			int amount = 60*60*24*7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
			memberService.keepLogin(memberDTO.getMem_id(), httpSession.getId(), sessionLimit);
		}
		return "main.do";
	}

}
