package kr.co.alto.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.club.dao.ClubDAO;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.mypage.service.MypageService;

@Controller("mainController")	
public class MainController {
	
	@Autowired
	private MypageService mypageService;
	@Autowired
	private ClubDAO clubDAO;

	
	@RequestMapping(value = "/main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView altoMain(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> memInfoMap = new HashMap<>();
		Map<String, Object> mainListMap = new HashMap<>();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		if(memberDTO != null) {
			String mem_id = memberDTO.getMem_id();
			
			memInfoMap = mypageService.selectMyList(mem_id);
			
			mav.addObject("memInfoMap", memInfoMap);			
		}
		
		List<HashMap<String, Object>> topHobby = clubDAO.selectTopHobby();
		mainListMap.put("topHobby", topHobby);
		
		mav.addObject("mainListMap", mainListMap);		
		mav.setViewName("main");
		
		return mav;
	}
}
