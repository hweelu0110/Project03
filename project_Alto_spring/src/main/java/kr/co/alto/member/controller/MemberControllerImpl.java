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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
public class MemberControllerImpl extends MultiActionController implements MemberController {
	
	@Autowired
	private MemberService memberService;
		
	@RequestMapping(value = "/member/joinTerms.do", method = RequestMethod.GET)
	public ModelAndView joinTerms(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value = "/member/joinFrm.do", method = RequestMethod.GET)
	public ModelAndView joinFrm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String register(MemberDTO memberDTO, RedirectAttributes rttr, Model model) throws Exception {
		
		String hashedPw = BCrypt.hashpw(memberDTO.getPwd(), BCrypt.gensalt());
		memberDTO.setPwd(hashedPw);
		memberService.register(memberDTO);
		model.addAttribute("member", memberDTO);
		
		rttr.addFlashAttribute("msg", "가입이 완료되었습니다.");
		rttr.addAttribute("memberEmail", memberDTO.getId());
		
		return "redirect:/member/registerAuth";
	}

	@Override
	@RequestMapping(value = "registerEmail", method = RequestMethod.GET)
	public String emailConfirm(String memberEmail, Model model) throws Exception {
		memberService.memberAuth(memberEmail);
		model.addAttribute("memberEmail", memberEmail);
		
		return "/member/registerEmail";
	}

	@Override
	@RequestMapping(value = "/idCnt", method = RequestMethod.POST)
	@ResponseBody
	public String idCnt(@RequestBody String filterJSON, HttpServletResponse response, ModelMap model) throws Exception {
		JSONObject resMap = new JSONObject();
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			MemberDTO searchDTO = (MemberDTO) mapper.readValue(filterJSON,new com.fasterxml.jackson.core.type.TypeReference<MemberDTO>() {
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
	@RequestMapping(value = "/loginFrm",method = RequestMethod.GET)
	public String loginFrm(@ModelAttribute("loginDTO") LoginDTO loginDTO, HttpServletRequest request, Model model) throws Exception {
		
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if(null != inputFlashMap) {
			model.addAttribute("msg",(String) inputFlashMap.get("msg"));
		}
		
		return "/member/loginFrm";
	}

	@Override
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
		MemberDTO memberDTO = memberService.login(loginDTO);
		
		if(memberDTO == null || !BCrypt.checkpw(loginDTO.getMemberPw(), memberDTO.getPwd())) {
			return "/member/loginCheck";
		}
		
		if(memberDTO.getAuthkey() == 0) {
			model.addAttribute("Auth", memberDTO.getAuthkey());
			return "/member/registerReady";
		}
		
		model.addAttribute("member",memberDTO);
		
		if (loginDTO.isUseCookie()) {
			int amount = 60*60*24*7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
			memberService.keepLogin(memberDTO.getId(), httpSession.getId(), sessionLimit);
		}
		return "main";
	}
}
