package kr.co.alto.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.alto.member.dto.LoginDTO;
import kr.co.alto.member.dto.MemberDTO;

public interface MemberController {

	public String register(MemberDTO memberDTO, RedirectAttributes rttr, Model model)throws Exception;
	public ResponseEntity<String> idCnt(@RequestParam("mem_id") String mem_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView loginView(@RequestParam("memberEmail") String memberEmail, @RequestParam("memberName") String memberName, HttpServletRequest request) throws Exception;
	public String loginFrm(@ModelAttribute("loginDTO") LoginDTO loginDTO, HttpServletRequest request, Model model) throws Exception;
	public String loginPost(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception;
	
	public ModelAndView emailConfirm(String memberEmail, String authKey, String memberName, HttpServletRequest request)throws Exception;
	
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;
	
	public ModelAndView findPw(MemberDTO memberDTO, HttpServletRequest request) throws Exception;
	
	public ResponseEntity<Object> selectMemberInfo(@RequestParam("mem_id")String mem_id, HttpServletRequest request) throws Exception;
}
