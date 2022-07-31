package kr.co.alto.hobby.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;


public interface HobbyController {
	
	public ModelAndView listHobbys(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception;
	public ModelAndView listHobbySub(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception;
}
