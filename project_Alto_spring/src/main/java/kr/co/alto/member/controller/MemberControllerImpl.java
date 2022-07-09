package kr.co.alto.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.member.service.MemberService;

@Controller("memberController")
public class MemberControllerImpl extends MultiActionController implements MemberController {
	
	@Autowired
	private MemberService memberService;

	@Override
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = getViewName(request);
		List<MemberDTO> membersList = memberService.listMembers();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}
	
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	// request 객체의 URL 요청명에서 .do를 제외한 뷰이름 가져오기
	private String getViewName(HttpServletRequest request) {
		
		String contextPath = request.getContextPath();
		//주소창의 현재 uri 받아오기
		String uri = (String) request.getAttribute("javax.servlet.include.reqest_uri");
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		
		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}
		
		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}
		
		String filename = uri.substring(begin, end);
		if (filename.indexOf(".") != -1) {
			filename = filename.substring(0, filename.lastIndexOf("."));
		}		

//		if (filename.indexOf("/") != -1) {
//			filename = filename.substring(filename.lastIndexOf("/"), filename.length());
//		}
		
		return filename;
	}

	@Override
	public ModelAndView addMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberDTO memberDTO = new MemberDTO();
		
//		String id = request.getParameter("id");
//		String pwd = request.getParameter("pwd");
//		String name = request.getParameter("name");
//		String email = request.getParameter("email");		
//		memberDTO.setId(id);
//		memberDTO.setPwd(pwd);
//		memberDTO.setName(name);
//		memberDTO.setEmail(email);
		
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
}
