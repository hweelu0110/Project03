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
	@RequestMapping(value = "/member/memArea.do", method = RequestMethod.GET)
	public ModelAndView listAreas(HttpServletRequest request, HttpServletResponse response) throws Exception {
<<<<<<< HEAD
		String viewName = (String) request.getAttribute("viewName");
		List<AreaDTO> areaList = areaService.listAreas();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("areaList", areaList);
		
		return mav;
	}
	
=======
		String viewName = getViewName(request);
		List<AreaDTO> areaList = areaService.listAreas();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("areaList", areaList);
		
		return mav;
	}
	
	// request 객체의 URL 요청명에서 .do를 제외한 뷰이름 가져오기
		private String getViewName(HttpServletRequest request) {
			
			String contextPath = request.getContextPath();
			//주소창의 현재 uri 받아오기
			String uri = (String) request.getAttribute("javax.servlet.include.reqest_uri");
			if(uri == null || uri.trim().equals("")) {
				uri = request.getRequestURI();
			}
			
			int begin = 0;
			if (!((contextPath == null) || ("".equals(contextPath)))) {
				begin = contextPath.length();
			}
			
			int end;
			if (uri.indexOf(";") != -1) {
				end = uri.indexOf(";");
			} else if (uri.indexOf("?") != -1) {
				end = uri.indexOf("?");
			} else {
				end = uri.length();
			}
			
			String filename = uri.substring(begin, end);
			if (filename.indexOf(".") != -1) {
				filename = filename.substring(0, filename.lastIndexOf("."));
			}
						
			return filename;
		}

>>>>>>> refs/remotes/origin/woosb
}
