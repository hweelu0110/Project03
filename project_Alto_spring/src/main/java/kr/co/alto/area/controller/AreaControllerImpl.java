package kr.co.alto.area.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import kr.co.alto.area.dto.AreaDTO;
import kr.co.alto.area.service.AreaService;
import kr.co.alto.member.dto.MemberDTO;

@Controller("areaController")
public class AreaControllerImpl extends MultiActionController implements AreaController {
	
	@Autowired
	private AreaService areaService;

	@Override
	@RequestMapping(value = "/mypage/memArea.do", method = RequestMethod.GET)
	public ModelAndView listAreas(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> areaList = new HashMap<>();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		
		areaList = areaService.listAreas(mem_id);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("areaList", areaList);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/memAreaUpdate.do")
	public ResponseEntity memAreaUpdate(HttpServletRequest request, HttpSession httpSession,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message;
		ResponseEntity resEnt = null;
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("login");
		String mem_id = memberDTO.getMem_id();
		String[] areacodeList = request.getParameterValues("area_code");
		List<AreaDTO> areaList = new ArrayList<>();
		Map memAreaMap = new HashMap<>();
		
		int count = areacodeList.length;		
		
		for(int i=0; i<count; i++) { 
			AreaDTO areaDTO = new AreaDTO();
			areaDTO.setArea_code(areacodeList[i]);
			areaList.add(areaDTO);
		}	
		
		memAreaMap.put("areaList", areaList);
		memAreaMap.put("mem_id", mem_id);
		
		try {
			
			areaService.memAreaUpdate(mem_id, memAreaMap);
				
			message = "<script>";
			message += " alert('내 지역 설정 완료.');";
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
