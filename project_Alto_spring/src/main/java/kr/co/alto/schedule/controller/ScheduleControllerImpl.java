package kr.co.alto.schedule.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.board.dto.BoardDTO;
import kr.co.alto.board.dto.FileDTO;
import kr.co.alto.board.service.BoardService;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.schedule.dto.ScheduleDTO;
import kr.co.alto.schedule.service.ScheduleService;



@Controller
public class ScheduleControllerImpl implements ScheduleController {
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private ScheduleDTO scheduleDTO;
	
	@Override
	@RequestMapping(value = "/club_schedule/listSchedule.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		//section값과 pageNum값을 구함
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		String club_code = request.getParameter("club_code");
		
		//최초 요청시 section값과 pageNum값이 없으면 각각 1로 초기화함
		int section = Integer.parseInt(((_section == null) ? "1" : _section));
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
		
		Map<String , Object> pagingMap = new HashMap<>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("club_code", club_code); 
				
		Map<String, Object> scheduleMap = scheduleService.listSchedule(pagingMap);
		
		scheduleMap.put("section", section);
		scheduleMap.put("pageNum", pageNum);
		scheduleMap.put("club_code", club_code);		
		
		mav.addObject("scheduleMap", scheduleMap);
		
		return mav;
	}
	
	@RequestMapping(value = "/club_schedule/*Form.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	// 글추가
	@Override
	@RequestMapping(value = "/club_schedule/addNewSchedule.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewSchedule(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String cate = request.getParameter("cate");
		String tit = request.getParameter("tit");
		
		//글정보 저장하기 위한 Map 생성
		Map scheduleMap = new HashMap();
		Enumeration enun = request.getParameterNames();
		
		//새글쓰기창에서 전송된 글 정보를 Map에 key/value로 저장함
		while(enun.hasMoreElements()) {
			String name = (String) enun.nextElement();
			String value = request.getParameter(name);
			scheduleMap.put(name, value);
		}
		
		//로그인 시 세션에 저장된 회원정보에서 아이디(글쓴이)를 Map에 저장
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		scheduleMap.put("mem_id", mem_id);
		
		String club_code = (String) scheduleMap.get("club_code");
						
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		String message;
		ResponseEntity resEnt = null;
				
		try {
				
			int schedule_code = scheduleService.addNewSchedule(scheduleMap);		
							
			message = "<script>";
			message += " alert('새 일정을 추가했습니다.');";
			message += " location.href='"+request.getContextPath()+"/club_schedule/listSchedule.do?club_code="+club_code+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";
				
			// 새 글을 추가한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
		} catch (Exception e) {
							
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/club_schedule/scheduleForm.do?club_code="+club_code+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
			e.printStackTrace();
		}		
					
		return resEnt;
	}	
			
	@Override
	@RequestMapping(value = "/club_schedule/editSchedule.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView editSchedule(@RequestParam("schedule_code") int schedule_code, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
		
		String mem_id= null;
		if (memberDTO != null) {
			mem_id = memberDTO.getMem_id();
		}
		
		Map<String, Object> viewMap = new HashMap<>();
		viewMap.put("schedule_code", schedule_code);
		viewMap.put("mem_id", mem_id);
				
		Map<String, Object> scheduleMap = scheduleService.viewSchedule(viewMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("scheduleMap", scheduleMap);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/club_schedule/modSchedule.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modSchedule(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String club_code = request.getParameter("club_code");
		String cate = request.getParameter("cate");
		String tit = request.getParameter("tit");
		
		Map<String, Object> scheduleMap = new HashMap<>();
		
		Enumeration enu = request.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			scheduleMap.put(name, value);
		}
				
		String schedule_code = (String) scheduleMap.get("schedule_code");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		
		try {
			scheduleService.modSchedule(scheduleMap);
			
			message = "<script>";
			message += " alert('일정을 수정했습니다.');";
			message += " location.href='"+request.getContextPath()+"/club_schedule/listSchedule.do?club_code="+club_code+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";
			
			// 새 글을 추가한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);		
			
		} catch (Exception e) {
						
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/club_schedule/listSchedule.do?club_code="+club_code+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();			
		}
		
	
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/club_schedule/removeSchedule.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ResponseEntity removeSchedule(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=utf-8");
		
		String schedule_code = request.getParameter("schedule_code");
		String club_code = request.getParameter("club_code");
		String cate = request.getParameter("cate");
		String tit = request.getParameter("tit");
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");	
		
		String message;
		ResponseEntity resEnt = null;
		
		try {
			scheduleService.removeSchedule(schedule_code);			
			
			message = "<script>";
			message += " alert('일정을 삭제했습니다.');";
			message += " location.href='"+request.getContextPath()+"/club_schedule/listSchedule.do?club_code="+club_code+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";
			
			// 글 삭제 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);					
		} catch (Exception e) {
			message = "<script>";
			message += " alert('글을 삭제하는 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/club_schedule/listSchedule.do?club_code="+club_code+"&cate="+cate+"&tit="+tit+"';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();			
		}
				
		return resEnt;
	}
	
	// 일정 참석
	@Override
	@RequestMapping(value = "/club_schedule/promiseIn.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity promiseIn(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Object URL = session.getAttribute("URL");
		
		String club_code = request.getParameter("club_code");
		String schedule_code = request.getParameter("schedule_code");
		
		Map<String, Object> promiseMap = new HashMap<>();
		promiseMap.put("club_code", club_code);
		promiseMap.put("schedule_code", schedule_code);
				
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		promiseMap.put("mem_id", mem_id);
			
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		String message;
		ResponseEntity resEnt = null;
				
		try {
				
			scheduleService.promiseIn(promiseMap);		
							
			message = "<script>";
			message += " alert('일정 참석 완료!');";
			message += " location.href='"+URL+"';";
			message += "</script>";
				
			// 새 글을 추가한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
		} catch (Exception e) {
							
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+URL+"';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
			e.printStackTrace();
		}		
					
		return resEnt;
	}	
	
}