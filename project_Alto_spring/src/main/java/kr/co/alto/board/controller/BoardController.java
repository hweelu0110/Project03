package kr.co.alto.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {
	public ModelAndView Noticelist(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewNotice(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
