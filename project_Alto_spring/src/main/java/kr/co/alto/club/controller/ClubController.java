package kr.co.alto.club.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.hobby.dto.HobbysubDTO;

public interface ClubController {
	
	public ModelAndView clubInfo(@RequestParam(value="club_code", required = false) String club_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView clubMain(HttpServletRequest request, HttpSession httpSession) throws Exception;
	public ModelAndView clubSearhList(@RequestParam(value="hobby_code", required = false) String hobby_code, HttpServletRequest request, HttpSession httpSession) throws Exception;
		
	public ResponseEntity clubRegister(@ModelAttribute("club") ClubDTO clubDTO, HttpServletRequest request, HttpSession httpSession) throws Exception;
}
