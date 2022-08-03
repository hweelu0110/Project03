package kr.co.alto.area.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface AreaController {
	
	public ModelAndView listAreas(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception;
	
	public ResponseEntity memAreaUpdate(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception;
}
