package kr.co.alto.hobby.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	public ModelAndView listHobbySub(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		
		String hobbyCodeList = request.getParameter("hobbyCodeList");
		String[] arrhcodelist = hobbyCodeList.split(",");
		HashMap<String, String> codeList = new HashMap<String, String>();
		Map<String, Object> hobbysublist = new HashMap<>();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		
		codeList.put("code1", arrhcodelist[0]);
		codeList.put("code2", arrhcodelist[1]);
		codeList.put("code3", arrhcodelist[2]);
		codeList.put("code4", arrhcodelist[3]);
		codeList.put("code5", arrhcodelist[4]);
		
		hobbysublist = hobbyService.listHobbysub(codeList, mem_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("hobbysublist", hobbysublist);
		return mav;
	}


	@Override
	@RequestMapping(value = "/mypage/memHobbyUpdate.do", method = RequestMethod.POST)
	public ResponseEntity memHobbyUpdate(HttpServletRequest request, HttpSession httpSession,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message;
		ResponseEntity resEnt = null;
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		
		String[] main_codeList = request.getParameterValues("main_code");
		String[] sub_codeList = request.getParameterValues("sub_code");
		int mCnt = main_codeList.length;
		int sCnt = sub_codeList.length;
		
		HashMap<String, Object> memHobbyList = new HashMap<>();
		List<HobbysubDTO> hobbysubList = new ArrayList<>();
		if(sub_codeList != null && sCnt != 0) {
			String main_code;
			String sub_code;
			
			for(int i=0; i<mCnt ; i++) {
				String mCode = main_codeList[i].substring(6);
				
				for(int j=0; j<sCnt ; j++) {
					String sCode = sub_codeList[j].substring(2,4);
					main_code = main_codeList[i];
					if(sCode.equals(mCode)) {
						sub_code = sub_codeList[j];				
							
					}else {
						sub_code = "";
					}
				}
			}
			memHobbyList.put("hobbysubList", hobbysubList);
		}		
		
		try {
			
			hobbyService.memHobbyUpdate(mem_id, memHobbyList);
				
			message = "<script>";
			message += " alert('내 취미 설정 완료.');";
			message += " location.href='"+request.getContextPath()+"/mypage/myMain.do';";
			message += "</script>";
			
			// 삭제 후 메세지 전달
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/mypage/myMain.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		}		

		return resEnt;
	}


}
