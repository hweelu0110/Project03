package kr.co.alto.hobby.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public interface HobbyController {
	
	public ModelAndView listHobbys(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception;
	public ModelAndView listHobbySub(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception;
	
	public ResponseEntity memHobbyUpdate(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception;
	
	public ResponseEntity<Object> selectSubHobby(@RequestParam("hobby_code")String hobby_code, HttpServletRequest request) throws Exception;
}
