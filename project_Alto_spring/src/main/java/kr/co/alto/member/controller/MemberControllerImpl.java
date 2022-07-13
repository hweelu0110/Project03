package kr.co.alto.member.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.member.service.MemberService;

@Controller("memberController")
public class MemberControllerImpl extends MultiActionController implements MemberController {
	
	@Autowired
	private MemberService memberService;

	@Override
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		List<MemberDTO> membersList = memberService.listMembers();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}
	
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	public ModelAndView addMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberDTO memberDTO = new MemberDTO();
		
		//MultiActionController 제공 메서드
		bind(request, memberDTO);
		
		int result = memberService.addMember(memberDTO);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		
		return mav;
	}

	@Override
	public ModelAndView removeMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		memberService.removeMember(id);		
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String register(MemberDTO memberDTO, RedirectAttributes rttr, Model model) throws Exception {
		
		MemberDTO memberDTO = memeberService.login(loginDTO);
		if(memberDTO == null || !BCrypt.checkpw(loginDTO.getMemberPw(), memberDTO.getPwd())) {
			return "/member/loginCheck";
		}
		
		if(memberDTO.getAuthkey() == 0) {
			model.addAttribute("Auth", memberDTO.getAuthkey());
			return "member/registerReady";
		}
		
		model.addAttribute("member", memberDTO);
		
		if(loginDTO.isUseCookie()) {
			int amount = 60*60*24*7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
			memberService.keepLogin(memberDTO.getId(), HttpSession.getId(), sessionLimit);
		}
		return "board/list";
	}

	@Override
	public String emailConfirm(String memberEmail, Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String idCnt(String filterJSON, HttpServletResponse response, ModelMap model) throws Exception {
		JSONObject resMap = JSONObject();
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			MemberDTO searchDTO = (MemberDTO) mapper.readValue(filterJSON, new TypeReference<MemberDTO>() {
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
}
