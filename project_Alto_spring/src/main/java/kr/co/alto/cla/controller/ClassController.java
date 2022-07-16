package kr.co.alto.cla.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface ClassController {
	
	public ModelAndView classMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listClass (HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public void download(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response) throws Exception;
		
}
