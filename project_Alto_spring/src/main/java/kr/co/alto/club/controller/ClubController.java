package kr.co.alto.club.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.club.dto.ClubDTO;

public interface ClubController {
	
	public ModelAndView clubMain(HttpServletRequest request, HttpSession httpSession) throws Exception;
	public ModelAndView clubSearhList(String hobby_code, HttpServletRequest request, HttpSession httpSession) throws Exception;
		
	public ResponseEntity clubRegister(ClubDTO clubDTO, HttpServletRequest request, HttpSession httpSession) throws Exception;
	
	public ModelAndView clubInfo(String club_code, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception;
	
	public void download(String imageFileName, HttpServletResponse response) throws Exception;
	
	public ResponseEntity clubInfoEdit(MultipartHttpServletRequest mpRequest, HttpSession httpSession) throws Exception;
	
	public ResponseEntity clubJoin(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity clubOut(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
