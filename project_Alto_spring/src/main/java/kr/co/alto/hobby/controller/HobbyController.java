package kr.co.alto.hobby.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface HobbyController {
	
	public ModelAndView listHobbys(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
