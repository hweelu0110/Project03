package kr.co.alto.hobby.controller;

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
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import kr.co.alto.hobby.dto.HobbyDTO;
import kr.co.alto.hobby.dto.HobbysubDTO;
import kr.co.alto.hobby.service.HobbyService;
import kr.co.alto.member.dto.MemberDTO;


@Controller("hobbyController")
public class HobbyControllerImpl extends MultiActionController implements HobbyController {
	
	@Autowired
	private HobbyService hobbyService;

	@Override
	@RequestMapping(value = "/mypage/memHobby.do", method = RequestMethod.GET)
	public ModelAndView listHobbys(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> hobbyList = new HashMap<>();	
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		
		hobbyList = hobbyService.listHobbys(mem_id);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("hobbyList", hobbyList);
		
		return mav;
	}
	

	@Override
	@RequestMapping(value = "/mypage/memHobby_sub.do", method = RequestMethod.POST)
	public ModelAndView listHobbySub(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		String hobbyCodeList = request.getParameter("hobbyCodeList");
		String[] arrhcodelist = hobbyCodeList.split(",");
		HashMap<String, String> codeList = new HashMap<String, String>();
		
		codeList.put("code1", arrhcodelist[0]);
		codeList.put("code2", arrhcodelist[1]);
		codeList.put("code3", arrhcodelist[2]);
		codeList.put("code4", arrhcodelist[3]);
		codeList.put("code5", arrhcodelist[4]);
		
		
		List<HobbysubDTO> hobbysublist = hobbyService.listHobbysub(codeList);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("hobbysublist", hobbysublist);
		return mav;
	}


}
