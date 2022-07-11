package kr.co.alto.area.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AreaController {
	
	public ModelAndView listAreas(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
