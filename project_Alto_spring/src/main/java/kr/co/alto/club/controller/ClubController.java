package kr.co.alto.club.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface ClubController {
	
	public ModelAndView clubMain(HttpServletRequest request, HttpSession httpSession) throws Exception;
	public ModelAndView clubSearhList(HttpServletRequest request, HttpSession httpSession) throws Exception;
}
