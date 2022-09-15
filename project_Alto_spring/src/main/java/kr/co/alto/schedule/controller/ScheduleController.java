package kr.co.alto.schedule.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface ScheduleController {
	
	public ModelAndView listSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView editSchedule(@RequestParam("schedule_code") int schedule_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
			
	public ResponseEntity modSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity removeSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity promiseIn(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;
}
