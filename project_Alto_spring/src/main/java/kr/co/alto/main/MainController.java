package kr.co.alto.main;

import java.util.ArrayList;
import java.util.Enumeration;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.alto.club.dao.ClubDAO;
import kr.co.alto.club.dto.ClubListDTO;
import kr.co.alto.club.service.ClubService;
import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.area.dto.AreaDTO;
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
	@Autowired
	private ClubService clubService;
	
	
	@RequestMapping(value = "/main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView altoMain(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> memInfoMap = new HashMap<>();
		Map<String, Object> mainListMap = new HashMap<>();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		if(memberDTO != null) {
			String mem_id = memberDTO.getMem_id();
			
			memInfoMap = mypageService.selectMyList(mem_id);			
			List<likeDTO> memlikeList = mypageService.selectLikeList(mem_id);	
			List<ClubListDTO> memclubList = mypageService.selectActivClubList(mem_id);
			
			memInfoMap.put("memlikeList", memlikeList);	
			memInfoMap.put("memclubList", memclubList);
			mav.addObject("memInfoMap", memInfoMap);			
		}
		
		List<HashMap<String, Object>> topHobby = clubService.selectTopHobby();
		List<ClubListDTO> bestClubList = clubService.selectBestClubList();
		List<ClubListDTO> newClubList = clubService.selectNewClubList();
		
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
	
	@RequestMapping(value = "/main/searchMain.do", method = RequestMethod.POST)
	public ModelAndView searchMain(@RequestParam("keyword") String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Map<String, Object> searchMainMap = new HashMap<>();
		searchMainMap.put("keyword", keyword);
		
		List clubSearch = clubService.keywordClub(keyword);
		searchMainMap.put("clubSearch", clubSearch);
		
		List classSearch = classService.keywordClass(keyword);
		searchMainMap.put("classSearch", classSearch);
		
		List itemSearch = itemService.keywordItem(keyword);
		searchMainMap.put("itemSearch", itemSearch);
		
		mav.addObject("searchMainMap", searchMainMap);
		
		return mav;
	}
	
	@RequestMapping(value = "/main/aloneList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView aloneList(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Map<String, Object> aloneMap = new HashMap<>();
		
		//로그인 상태인 경우 관심목록 가져오기
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		if (memberDTO != null) {
			String mem_id = memberDTO.getMem_id();
			List<likeDTO> memlikeList = new ArrayList<>();
			memlikeList = mypageService.selectLikeList(mem_id);
			
			mav.addObject("memlikeList", memlikeList);
		}		
		
		List<ClubListDTO> aloneClubList = clubService.aloneClubList();
		
		Map<String, Object> aloneClassMap = new HashMap<>();
		List<String> areaSearchList = new ArrayList<>();
		areaSearchList.add("area0001");
		aloneClassMap.put("areaSearchList", areaSearchList);
		List<ClassDTO> aloneClassList = classService.listClass(aloneClassMap);
		
		HashMap<String, Object> listMapItemNew = new HashMap<>();
		listMapItemNew.put("sort", "new");
		List<ItemDTO> itemListNew = itemService.listItem(listMapItemNew);
		
		aloneMap.put("aloneClubList", aloneClubList);
		aloneMap.put("aloneClassList", aloneClassList);
		aloneMap.put("itemListNew", itemListNew);
		
		mav.addObject("aloneMap", aloneMap);
		
		return mav;
	}
	
}
