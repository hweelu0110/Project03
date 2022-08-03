package kr.co.alto.club.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.club.service.ClubService;
import kr.co.alto.common.base.BaseController;
import kr.co.alto.hobby.service.HobbyService;
import kr.co.alto.member.dto.MemberDTO;

@Controller("clubController")
@RequestMapping("/club")
public class ClubControllerImpl extends BaseController implements ClubController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);
	
	@Autowired
	private ClubService clubService;
	@Autowired
	private HobbyService hobbyService;
	@Autowired
	private ClubDTO clubDTO;
	
	@Override
	@RequestMapping(value = "/clubMain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView clubMain(HttpServletRequest request, HttpSession httpSession) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		if(memberDTO != null) {			
			mav.setViewName("redirect:/club/clubSearchList.do");
		} else {
			Map<String, Object> clubMainMap = new HashMap<>();
			
			clubMainMap = clubService.clubMainList();
			
			mav.addObject("clubMainMap", clubMainMap);
			mav.setViewName(viewName);
		}
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/clubSearchList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView clubSearhList(HttpServletRequest request, HttpSession httpSession) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> clubSearchMap = new HashMap<>();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		if(memberDTO != null) {
			String mem_id = memberDTO.getMem_id();
			clubSearchMap = clubService.clubSearchList(mem_id);
			
			mav.addObject("clubSearchMap", clubSearchMap);
			mav.setViewName(viewName);
		} else {
			mav.setViewName("redirect:/club/clubMain.do");
		}
		
		return mav;
	}

	

}
