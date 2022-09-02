package kr.co.alto.cla.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface ClassController {
	
	public ModelAndView classMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listClass (String hobbyCodeList, String areaCodeList, String sort, String hobbyC, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addNewClass(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ModelAndView editClass(String class_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modClass(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

	public ModelAndView searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView classDetail(String class_code,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
