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
import kr.co.alto.club.dto.ClubListDTO;
import kr.co.alto.cla.dto.ClassDTO;
import kr.co.alto.cla.service.ClassService;
import kr.co.alto.item.dto.ItemDTO;
import kr.co.alto.item.service.ItemService;
import kr.co.alto.member.dto.MemberDTO;
import kr.co.alto.mypage.dao.MypageDAO;
import kr.co.alto.mypage.dto.likeDTO;
import kr.co.alto.mypage.service.MypageService;

@Controller("mainController")	
public class MainController {
	
	@Autowired
	private MypageService mypageService;
	@Autowired
	private ClubDAO clubDAO;
	@Autowired
	private MypageDAO mypageDAO;
	
	@Autowired
	private ClassService classService;	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping(value = "/main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView altoMain(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> memInfoMap = new HashMap<>();
		Map<String, Object> mainListMap = new HashMap<>();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		if(memberDTO != null) {
			String mem_id = memberDTO.getMem_id();
			
			memInfoMap = mypageService.selectMyList(mem_id);
			List<likeDTO> memlikeList = mypageDAO.selectLikeList(mem_id);		
			
			memInfoMap.put("memlikeList", memlikeList);
			
			mav.addObject("memInfoMap", memInfoMap);			
		}
		
		List<HashMap<String, Object>> topHobby = clubDAO.selectTopHobby();
		List<ClubListDTO> bestClubList = clubDAO.selectBestClubList();
		List<ClubListDTO> newClubList = clubDAO.selectNewClubList();
		mainListMap.put("topHobby", topHobby);
		mainListMap.put("bestClubList", bestClubList);
		mainListMap.put("newClubList", newClubList);
		
		mav.addObject("mainListMap", mainListMap);		
		
		Map listMapClassBest = new HashMap<>();
		listMapClassBest.put("sort", "stuU");
		List<ClassDTO> classListBest = classService.listClass(listMapClassBest);
		
		Map listMapClassNew = new HashMap<>();
		listMapClassNew.put("sort", "new");
		List<ClassDTO> classListNew = classService.listClass(listMapClassNew);
		
		mav.addObject("classListBest", classListBest);
		mav.addObject("classListNew", classListNew);
		
		Map listMapItemBest = new HashMap<>();
		listMapItemBest.put("sort", "quantityS");
		List<ItemDTO> itemListBest = itemService.listItem(listMapItemBest);
		
		Map listMapItemNew = new HashMap<>();
		listMapItemNew.put("sort", "new");
		List<ItemDTO> itemListNew = itemService.listItem(listMapItemNew);
		
		mav.addObject("itemListBest", itemListBest);
		mav.addObject("itemListNew", itemListNew);
	
		mav.setViewName("main");
		
		return mav;
	}
}
