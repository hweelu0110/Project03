package kr.co.alto.club.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.club.dto.ClubDTO;

public interface ClubController {
	
	public ModelAndView clubMain(HttpServletRequest request, HttpSession httpSession) throws Exception;
	public ModelAndView clubSearhList(HttpServletRequest request, HttpSession httpSession) throws Exception;
	
	public ResponseEntity clubRegister(@ModelAttribute("club") ClubDTO clubDTO, HttpServletRequest request, HttpSession httpSession) throws Exception;
}
