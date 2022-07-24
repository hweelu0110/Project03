package kr.co.alto.area.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import kr.co.alto.area.dto.AreaDTO;
import kr.co.alto.area.service.AreaService;

@Controller("areaController")
public class AreaControllerImpl extends MultiActionController implements AreaController {
	
	@Autowired
	private AreaService areaService;

	@Override
	@RequestMapping(value = "/mypage/memArea.do", method = RequestMethod.GET)
	public ModelAndView listAreas(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<AreaDTO> areaList = areaService.listAreas();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("areaList", areaList);
		
		return mav;
	}
	
}
