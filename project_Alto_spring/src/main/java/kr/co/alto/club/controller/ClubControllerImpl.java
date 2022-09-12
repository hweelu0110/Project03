package kr.co.alto.club.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.board.dto.FileDTO;
import kr.co.alto.board.service.BoardService;
import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.club.service.ClubService;
import kr.co.alto.common.base.BaseController;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.mypage.dto.likeDTO;
import kr.co.alto.mypage.service.MypageService;

@Controller("clubController")
@RequestMapping("/club")
public class ClubControllerImpl extends BaseController implements ClubController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);
	
	@Autowired
	private ClubService clubService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private ClubDTO clubDTO;
	@Autowired
	private BoardService boardService;
	
	@Override
	@RequestMapping(value = "/clubMain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView clubMain(HttpServletRequest request, HttpSession httpSession) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		Map<String, Object> clubMainMap = new HashMap<>();
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = "";
		if (memberDTO != null) {
			mem_id = memberDTO.getMem_id();
		}
		
		clubMainMap = clubService.clubMainList(mem_id);
		
		mav.addObject("clubMainMap", clubMainMap);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/clubSearchList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView clubSearhList(@RequestParam(value="hobbyC", required = false) String hobbyC, HttpServletRequest request, HttpSession httpSession) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> clubSearchMap = new HashMap<>();
		
		//로그인 상태인 경우 관심목록 가져오기
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		if (memberDTO != null) {
			String mem_id = memberDTO.getMem_id();
			List<likeDTO> memlikeList = new ArrayList<>();
			memlikeList = mypageService.selectLikeList(mem_id);
			
			mav.addObject("memlikeList", memlikeList);
		}		
		
		if(hobbyC != null) {
			clubSearchMap = clubService.selectHobClubList(hobbyC);
			
			mav.addObject("hobbyC", hobbyC);
			mav.addObject("clubSearchMap", clubSearchMap);
		}else {
			clubSearchMap = clubService.clubSearchList();
			
			mav.addObject("clubSearchMap", clubSearchMap);
		}
						
		mav.setViewName(viewName);
		return mav;
	}	

	@Override
	@RequestMapping(value = "/clubRegister.do", method = RequestMethod.POST)
	public ResponseEntity clubRegister(@ModelAttribute("club") ClubDTO clubDTO,  HttpServletRequest request, HttpSession httpSession) throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String manager = memberDTO.getMem_id();
		
		clubDTO.setManager(manager);	
		
		try {	
			String club_code = clubService.clubOpen(clubDTO);			
			
			message = "<script>";
			message += " alert('모임 개설 완료');";
			message += " location.href='"+request.getContextPath()+"/club/clubInfo.do?club_code="+club_code+"';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/club/clubSearchList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		}
				
		return resEnt;
	}	
	
	@RequestMapping(value = "/clubInfo.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView clubInfo(@RequestParam(value="club_code", required = false) String club_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();		
		String viewName = (String)request.getAttribute("viewName");
		
		Map<String, Object> clubInfoMap = new HashMap<>();
		
		clubInfoMap = clubService.selectClubInfo(club_code);		
		
		mav.addObject("clubInfoMap", clubInfoMap);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/clubJoin.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity clubJoin(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String club_code = request.getParameter("club_code");
		
		Map articleMap = new HashMap();
		Map<String, Object> joinMap = new HashMap<>();
		Enumeration enun = request.getParameterNames();
		
		while(enun.hasMoreElements()) {
			String name = (String) enun.nextElement();
			String value = request.getParameter(name);
			articleMap.put(name, value);
		}
		
		//로그인 시 세션에 저장된 회원정보에서 아이디(글쓴이)를 Map에 저장
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		articleMap.put("mem_id", mem_id);
		joinMap.put("mem_id", mem_id);
		joinMap.put("club_code", club_code);
				
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		String message;
		ResponseEntity resEnt = null;
				
		try {
				
			boardService.addNewArticle(articleMap);		//articleMap을 서비스 클래스로 전달함
			clubService.clubJoin(joinMap); 					//가입정보 전달하기
							
			message = "<script>";
			message += " alert('가입 완료!');";
			message += " location.href='"+request.getContextPath()+"/club/clubInfo.do?club_code="+club_code+"';";
			message += "</script>";
				
			// 새 글을 추가한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
		} catch (Exception e) {
							
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/club/clubInfo.do?club_code="+club_code+"';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
			e.printStackTrace();
		}		
					
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/clubOut.do", method = RequestMethod.GET)
	public ResponseEntity clubOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String club_code = request.getParameter("club_code");		
		
		//로그인 시 세션에 저장된 회원정보에서 아이디(글쓴이)를 Map에 저장
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
				
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		String message;
		ResponseEntity resEnt = null;
				
		try {
				
			clubService.clubOut(mem_id, club_code);
							
			message = "<script>";
			message += " location.href='"+request.getContextPath()+"/club/clubInfo.do?club_code="+club_code+"';";
			message += "</script>";
				
			// 새 글을 추가한 후 메시지를 전달함
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
		} catch (Exception e) {
							
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/club/clubInfo.do?club_code="+club_code+"';";
			message += "</script>";			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
			e.printStackTrace();
		}		
					
		return resEnt;
	}
	

}
