package kr.co.alto.item.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface ItemController {
	
	public ModelAndView itemMain(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception;
	public ModelAndView listItem (String hobbyCodeList, String sort, String hobbyC, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewItem(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ModelAndView editItem(String item_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modItem(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
