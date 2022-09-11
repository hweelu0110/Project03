package kr.co.alto.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {

	public ModelAndView cartMain(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception;
	
	public ResponseEntity addCart(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception;
	public ResponseEntity deleteCart(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception;
	public ResponseEntity quanEditCart(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception;
}
