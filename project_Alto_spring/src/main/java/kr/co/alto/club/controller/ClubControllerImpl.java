package kr.co.alto.club.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.area.dto.AreaDTO;
import kr.co.alto.area.service.AreaService;
import kr.co.alto.board.dto.FileDTO;
import kr.co.alto.board.service.BoardService;
import kr.co.alto.club.dto.ClubDTO;
import kr.co.alto.club.service.ClubService;
import kr.co.alto.common.base.BaseController;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.dto.HobbysubDTO;
import kr.co.alto.hobby.service.HobbyService;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.mypage.dto.likeDTO;
import kr.co.alto.mypage.service.MypageService;
import kr.co.alto.schedule.dto.PromiseDTO;
import kr.co.alto.schedule.dto.ScheduleDTO;
import kr.co.alto.schedule.service.ScheduleService;

@Controller("clubController")
@RequestMapping("/club")
public class ClubControllerImpl extends BaseController implements ClubController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);
	
	//모임 이미지파일 저장 위치 지정
	private static final String CLUB_IMG_PATH = "C:\\workspace-spring\\alto\\club";
	
	@Autowired
	private ClubService clubService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private HobbyService hobbyService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private ClubDTO clubDTO;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ScheduleService scheduleService;
	
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
	public ModelAndView clubSearhList(@RequestParam(value="hobbyC", required = false) String hobbyC, 
			                         HttpServletRequest request, HttpSession httpSession) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> clubSearchMap = new HashMap<>();
		
		String[] hobbyCodeList = request.getParameterValues("hobbyCode");
		String[] hobbySubCodeList = request.getParameterValues("hobbySubCode");
		String[] areaCodeList = request.getParameterValues("areaCode");
		String keyword = request.getParameter("keyword");
		String sort = request.getParameter("sort");
		String allhobbys = "false";
		
		//전체검색처리
		if(hobbyCodeList != null) {
			System.out.println(hobbyCodeList[0]);
			if(hobbyCodeList[0].equals("all")) {
				hobbyCodeList = null;
				allhobbys = "true";	
			}			
		}
		// 서브코드 확인
		if(hobbySubCodeList != null) {
			for(int i=0; i<hobbySubCodeList.length;i++) {
				System.out.println(hobbySubCodeList[i]);
			}
		}
		
		//지역 코드 확인
		if(areaCodeList != null) {
			for(int i=0; i<areaCodeList.length;i++) {
				System.out.println(areaCodeList[i]);
			}
		}
						
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("hobbyCodeList", hobbyCodeList);
		searchMap.put("hobbySubCodeList", hobbySubCodeList);
		searchMap.put("areaCodeList", areaCodeList);
		searchMap.put("keyword", keyword);
		searchMap.put("sort", sort);
		searchMap.put("allhobbys", allhobbys);		
				
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
			clubSearchMap = clubService.clubSearchList(searchMap);
			
			mav.addObject("clubSearchMap", clubSearchMap);
			mav.addObject("searchMap", searchMap);
		}
		
		if(hobbyCodeList != null) {
			List<HobbysubDTO> selectHobbySubList = hobbyService.selectSubHobbyList(searchMap);
			
			mav.addObject("selectHobbySubList", selectHobbySubList);
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
	public ModelAndView clubInfo(@RequestParam(value="club_code", required = false) String club_code, 
			                     HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
		ModelAndView mav = new ModelAndView();		
		String viewName = (String)request.getAttribute("viewName");
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		if(memberDTO != null) {
			String mem_id = memberDTO.getMem_id();
			
			//좋아요 여부 체크
			Map<String, Object> likeChk = new HashMap<>();
			likeChk.put("club_code", club_code);
			likeChk.put("mem_id", mem_id);
			String like_code = clubService.chkClubLikeYN(likeChk);
			
			if(like_code != null) {
				mav.addObject("like_code", like_code);
			}
		}		
		
		Map<String, Object> clubInfoMap = new HashMap<>();

		clubInfoMap = clubService.selectClubInfo(club_code);				
		
		//지역, 대분류 취미 전체 목록 가져오기
		List<AreaDTO> areaList = areaService.listAreas();		
		List<HobbyDTO> hobbyList = hobbyService.listHobbys();
		//클럽 주제 소분류 취미 목록 가져오기
		String hobby_code = clubService.selectClubHobbyCode(club_code);		
		List<HobbysubDTO> hobbySubList = hobbyService.selectSubHobbyList(hobby_code);
		//메인 일정 정보
		ScheduleDTO scheduleDTO = scheduleService.selectMainSchedule(club_code);
		
		if(scheduleDTO != null) {
			String schedule_code = scheduleDTO.getSchedule_code();
			List<PromiseDTO> promiseList = scheduleService.selectMainPromiseList(schedule_code);
			
			mav.addObject("promiseList", promiseList);
		}	
		
		mav.addObject("clubInfoMap", clubInfoMap);
		mav.addObject("areaList", areaList);
		mav.addObject("hobbySubList", hobbySubList);
		mav.addObject("hobbyList", hobbyList);
		mav.addObject("scheduleInfo", scheduleDTO);		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping("/clubImgDown.do")
	public void download(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response) throws Exception {
		
		OutputStream out = response.getOutputStream();		
		String downFile = CLUB_IMG_PATH + "\\"+ imageFileName;
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
		
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8]; 	
		while(true) {
			int count = in.read(buffer);
			if(count == -1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@Override
	@RequestMapping(value = "/clubInfoEdit.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity clubInfoEdit(MultipartHttpServletRequest mpRequest, HttpSession httpSession) throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","text/html; charset=utf-8");
		
		String club_code = mpRequest.getParameter("club_code");
		String club_img = upload(mpRequest);
		
		Map<String, Object> clubInfoMap = new HashMap<>();
		
		Enumeration enu = mpRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			
			if (name.equals("oldFileName")) {
				String value = mpRequest.getParameter(name);
				clubInfoMap.put(name, value);
			}
			else {
				String value = mpRequest.getParameter(name);
				clubInfoMap.put(name, value);
			}
		}
		
		String oldFileName  = String.valueOf(clubInfoMap.get("oldFileName"));
		
		if(club_img == null) {
			club_img = oldFileName;
		}
				
		String message;
		ResponseEntity resEnt = null;
		
		clubInfoMap.put("club_code", club_code);
		clubInfoMap.put("club_img", club_img);	
						
		try {	

			clubService.clubInfoEdit(clubInfoMap);		
			if(club_img != oldFileName) {
				File oldFile = new File(CLUB_IMG_PATH +"\\"+ oldFileName);
				oldFile.delete();
			}			
			
			message = "<script>";
			message += " alert('모임 정보 수정 완료');";
			message += " location.href='"+mpRequest.getContextPath()+"/club/clubInfo.do?club_code="+club_code+"';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+mpRequest.getContextPath()+"/club/clubInfo.do?club_code="+club_code+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		}
				
		return resEnt;
	}
	
	private String upload(MultipartHttpServletRequest multipartRequest) throws ServletException, IOException {
		
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		String fileName = fileNames.next();
		MultipartFile mFile = multipartRequest.getFile(fileName);
		String originalFilename = mFile.getOriginalFilename();
		
		if (originalFilename != "" && originalFilename != null) {
			fileName = originalFilename;		
			File file = new File(CLUB_IMG_PATH +"\\"+ fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();		
					mFile.transferTo(new File(CLUB_IMG_PATH +"\\"+ originalFilename));
				}
			}
		}else {													//첨부한 파일이 없었을 경우
			fileName = null;
		}
				
		return fileName;
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
				
			boardService.addNewArticle(articleMap);		
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
		Map<String, Object> joinMap = new HashMap<>();
		
		//로그인 시 세션에 저장된 회원정보에서 아이디(글쓴이)를 Map에 저장
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		
		joinMap.put("club_code", club_code);
		joinMap.put("mem_id", mem_id);
				
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		String message;
		ResponseEntity resEnt = null;
				
		try {
				
			clubService.clubOut(joinMap);
							
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
