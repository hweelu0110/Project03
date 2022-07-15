package kr.co.alto.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.alto.member.dto.LoginDTO;
import kr.co.alto.member.dto.MemberDTO;

public interface MemberController {

	public ModelAndView joinTerms(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public ModelAndView joinFrm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String register(MemberDTO memberDTO, RedirectAttributes rttr, Model model)throws Exception;
	public String idCnt(@RequestBody String filterJSON, HttpServletResponse response, ModelMap model) throws Exception;
	
	public String loginFrm(@ModelAttribute("loginDTO") LoginDTO loginDTO, HttpServletRequest request, Model model) throws Exception;
	public String loginPost(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception;
	
	public String emailConfirm(String memberEmail,Model model)throws Exception;
}
